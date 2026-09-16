local M = {}

local function fallback()
	require("hop").hint_words({})
end

local function mecab_charset()
	local result = vim.system({ "mecab", "-D" }, { text = true }):wait()
	local charset = result.stdout:match("charset:%s*([^%s]+)")
	if charset then
		return charset
	end

	return nil, result.stderr
end

local function convert(text, from, to)
	if from:lower() == to:lower() then
		return text
	end

	local ok, converted = pcall(vim.iconv, text, from, to)
	if not ok then
		return nil, converted
	end
	return converted
end

local function tokenize(lines, charset)
	local input, err = convert(table.concat(lines, "\n") .. "\n", "utf-8", charset)
	if not input then
		return nil, err
	end

	local result = vim.system({
		"mecab",
		"--node-format=T\\t%ps\\t%pe\\t%f[0]\\n",
		"--unk-format=T\\t%ps\\t%pe\\t%f[0]\\n",
		"--bos-format=",
		"--eos-format=E\\n",
	}, { stdin = input }):wait()
	if result.code ~= 0 then
		return nil, result.stderr
	end

	local output
	output, err = convert(result.stdout, charset, "utf-8")
	if not output then
		return nil, err
	end

	local tokens = {}
	local line_index = 1
	for record in output:gmatch("[^\n]+") do
		if record == "E" then
			line_index = line_index + 1
		else
			local start_col, end_col, part_of_speech = record:match("^T\t(%d+)\t(%d+)\t(.*)$")
			start_col, end_col = tonumber(start_col), tonumber(end_col)
			local skip = { ["記号"] = true, ["補助記号"] = true, ["空白"] = true }

			if start_col and end_col and not skip[part_of_speech] then
				local encoded_line = convert(lines[line_index] or "", "utf-8", charset)
				local prefix = encoded_line and convert(encoded_line:sub(1, start_col), charset, "utf-8")
				local token = encoded_line and
				convert(encoded_line:sub(start_col + 1, end_col), charset, "utf-8")
				if prefix and token then
					tokens[#tokens + 1] = { line = line_index, col = #prefix, length = #token }
				end
			end
		end
	end

	return tokens
end

function M.hint_words()
	if vim.fn.executable("mecab") ~= 1 then
		vim.notify("MeCabが見つからないためHopWordを使用します", vim.log.levels.WARN)
		return fallback()
	end

	local charset, err = mecab_charset()
	if not charset then
		vim.notify("MeCab辞書を確認できません: " .. (err or "unknown error"), vim.log.levels.WARN)
		return fallback()
	end

	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_win_get_buf(win)
	local first_line = vim.fn.line("w0", win)
	local last_line = vim.fn.line("w$", win)
	local lines = vim.api.nvim_buf_get_lines(buf, first_line - 1, last_line, false)
	local tokens
	tokens, err = tokenize(lines, charset)
	if not tokens then
		vim.notify("MeCabの解析に失敗したためHopWordを使用します: " .. (err or "unknown error"), vim.log.levels.WARN)
		return fallback()
	end

	local jump_targets = {}
	for _, token in ipairs(tokens) do
		jump_targets[#jump_targets + 1] = {
			window = win,
			buffer = buf,
			cursor = { row = first_line + token.line - 1, col = token.col },
			length = token.length,
		}
	end

	local hop = require("hop")
	hop.hint_with(function()
		return { jump_targets = jump_targets }
	end, setmetatable({}, { __index = hop.opts }))
end

return M
