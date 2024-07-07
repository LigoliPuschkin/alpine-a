-- for detaild settings look:
	-- https://neovim.io/doc/user/options  "3.Options summery"
	-- https://neovim.io/doc/user/quickref.html#Q_op ↑-same but in shorter
--
local opt = vim.opt
	
	opt.autochdir = false 					-- changes dir corresponding to file
	opt.autoread = true					-- if file changed outside of nvim load again
	opt.autowrite = true 					-- Enable auto write
--	opt.background = "dark"				-- "dark" tells vim the background so it can change the couler of writing 

-- Backup
	--opt.backup = true						-- enables Backups to bekept arounf
	opt.writebackup=true				-- back up only during writing
	--opt.backupcopy="no"					-- secifies how to back up ← look it up
	
	opt.clipboard = "unnamedplus" 				-- Sync with system clipboard
	opt.completeopt = "menu,menuone,noselect"
	opt.conceallevel = 3 							-- Hide * markup for bold and italic
	opt.confirm = false								-- Confirm to save changes before exiting modified buffer
	opt.cursorline = false							-- Enable highlighting of the current line
	opt.expandtab = false 							-- Use spaces instead of tabs
	opt.exrc=false									-- allows to execute code
--	opt.editorconfig=
	--opt.guifont=("","","")						-- allows for setting fonts
	opt.formatoptions = "jcroqlnt" 				-- tcqj
	opt.grepformat = "%f:%l:%c:%m"
	opt.grepprg = "rg --vimgrep"
	opt.ignorecase = false 							-- Ignore case
	opt.inccommand = "nosplit" 					-- preview incremental substitute
	opt.incsearch = true
	opt.laststatus = 0
	opt.list = true 									-- Show some invisible characters (tabs...
	opt.mouse = "a" 								-- Enable mouse mode
	opt.number = true 							-- Print line number
	opt.numberwidth=3							-- 999 at 3, 9999 at 4
	opt.pumblend = 50 							-- sets transperancy of popup 0-100
	opt.pumheight = 10 							-- Maximum number of entries in a popup
	opt.relativenumber = true 					-- Relative line numbers
	opt.scrolloff = 0 								-- Lines of context
	opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
	opt.shiftround = false							-- Round indent
	opt.shiftwidth = 4 -- Size of an indent
	opt.shortmess:append { W = true, I = true, c = true }
	opt.showmode = false 							-- Dont show mode since we have a statusline
	opt.sidescrolloff = 4 							-- Columns of context
	opt.signcolumn = "yes" 						-- Always show the signcolumn, otherwise it would shift the text each time
	opt.smartcase = true 							-- Don't ignore case with capitals
	opt.smartindent = true 						-- Insert indents automatically
	opt.spelllang = { "en" }
	opt.splitbelow = true 							-- Put new windows below current
	opt.splitright = true 							-- Put new windows right of current
	--opt.syntax
	opt.tabstop = 4 								-- Number of spaces tabs count for
	opt.termguicolors = true 						-- True color support
	opt.timeoutlen = 750 							-- speed must be under 500ms inorder for keys to work, increase if you are not able to.
	opt.undofile = true
	opt.undolevels = 10000
	opt.updatetime = 200 						-- Save swap file and trigger CursorHold
	opt.wildmode = "longest:full,full" 			-- Command-line completion mode
	opt.winminwidth = 5 							-- Minimum window width
	opt.wrap = false 								-- Disable line wrap

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0


