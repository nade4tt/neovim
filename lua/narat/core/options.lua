-- ignore files
vim.opt.wildignore = {
	"*.pyc",
	"*_build/*",
	"**/coverage/*",
	"**/node_modules/*",
	"**/android/*",
	"**/ios/*",
	"**/.git/*",
}

vim.cmd("au BufRead,BufNewFile *.ejs setfiletype html")
vim.cmd("set t_ut=")

-- Essential
vim.opt.clipboard = "unnamedplus"
vim.opt.fileencoding = "utf-8"
vim.opt.syntax = "on"
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Enable filetypes
vim.g.do_filetype_lua = 0

-- Indents
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smartindent = false

-- Search
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Other
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.ruler = true
vim.opt.lazyredraw = true
vim.opt.wildmenu = true
vim.opt.history = 1000
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.updatetime = 50 -- faster completion (4000ms default)
vim.opt.spelllang = "en_us"
vim.opt.colorcolumn = "80"

-- TMUX
if vim.fn.empty("TMUX") then
	if vim.fn.has("nvim") then
		vim.cmd("let NVIM_TUI_ENABLE_TRUE_COLOR = 1")
	elseif vim.fn.has("termguicolors") then
		vim.opt.termguicolors = true
	end
end

-- Tagbar
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     vim.cmd("TagbarOpen")
--   end
-- })

local copilot_on = true
vim.api.nvim_create_user_command("CopilotToggle", function()
	if copilot_on then
		vim.cmd("Copilot disable")
		print("Copilot OFF")
	else
		vim.cmd("Copilot enable")
		print("Copilot ON")
	end
	copilot_on = not copilot_on
end, { nargs = 0 })
