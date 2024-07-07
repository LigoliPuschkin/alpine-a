local use_custom_nav = false 

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
	local keymap = vim.keymap.set

--Remap space as leader key
	keymap("", " ", "<Nop>", opts)
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

-- 	Mode		← used to declare when certain shortcuts are beeing used
--   normal_mode = "n",
--   insert_mode = "i", 	←also also allows you to write whenin terminal mode
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- using nvim =======================================================================

-- :e /file/path 		←opens File in
-- :vi /file/path		←creates new file
-- :saveas /file/path		←renames file and saves it in specifyed directory

-- " " s			←shortcut to ↓below↓ command 		→set in coustum
-- :vsplit /file/path		←splits nvim vertical and opens (optional) File in Path 
-- :split /file/path		←splits nvim hoeysontaly and opens (optional) File in Path

-- :tabnew			←opens new tab
-- :%!jq .			←formats .json file, need to have jq installed sudo dnf install jq

-- :tabp			←goes to prev tab
-- :tabn			←goes to next tab

-- https://lsp-zero.netlify.app/v3.x/autocomplete.html =============================
	-- zero-lsp has configured nvim-cmp ↑ with the obove defaults
	-- strg + y			← selects auto completion

-- NvimTree==========================================================================
	vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true})		-- " " + e opens Fileexplorer// apparently enables all Nvim Tree features" "+g+? to show all options
	--vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true})

	-- 			" " + d   → delets file/ folder
	--			" " + D    → Trash
	-- 			" " + a   → New Folder/file
	-- 			" " + r    → renames file folder
	--			" " + S    → Search
	--			" " + x    → Cut
	--			" " + p    → Paste
	--			" " + Y    → Copy relative path
	--			" " + S    → Search

-- coustum Keymaps =================================================================
	vim.keymap.set('n', '<leader>s', ':vsplit', { noremap = true, silent = false })
	vim.keymap.set('n', '<Tab>', ':tabn<CR>', { noremap = true, silent = false })
	vim.keymap.set('n', '<leader>t', ':tabnew ', { noremap = true, silent = false })
--	vim.keymap.set('n', )
	
-- code runner ======================================================================
	vim.keymap.set('n', '<leader>c', ':RunCode<CR>', { noremap = true, silent = false }) 
	vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
	vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
	vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
	vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
	vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
	vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })


-- Better window navigation same as navigation but for windows
-- C-?/A-? means "ctrl+"/"Alt+"
--	       Mode   newkey   usual keys
-- 	        ↓      ↓        ↓
if use_custom_nav == true then
	keymap("n", "<C-k>", "<C-w>h", opts) 		-- jumps window to the right
	keymap("n", "<C-l>", "<C-wA>j", opts)		-- jumps window to the down
	keymap("n", "<C-o>", "<C-w>k", opts)		-- jumps window to the up
	keymap("n", "<C-ö>", "<C-w>l", opts)		-- jumps window to the left
	
	keymap("n", "k", "h", opts)
	keymap("n", "l", "j", opts)
	keymap("n", "o", "k", opts)
	keymap("n", "ö", "l", opts)
	
	else
		keymap("n", "<C-h>", "<C-w>h", opts) 		-- jumps window to the right
		keymap("n", "<C-j>", "<C-wA>j", opts)		-- jumps window to the down
		keymap("n", "<C-k>", "<C-w>k", opts)		-- jumps window to the up
		keymap("n", "<C-l>", "<C-w>l", opts)		-- jumps window to the left
	
	end
	
-- Resize with arrows
	keymap("n", "<C-Up>", ":resize -2<CR>", opts)			-- rezises window up
	keymap("n", "<C-Down>", ":resize +2<CR>", opts)			-- rezises window down
	keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)	-- rezises window to the left
	keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)	-- rezises window to the right

-- Navigate buffers
	keymap("n", "<S-l>", ":bnext<CR>", opts)
	keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
	keymap("n", "<A-o>", ":m .+1<CR>==", opts)			-- Moves Markedtxt up/down
	keymap("n", "<A-k>", ":m .-2<CR>==", opts)			-- A-j means "Alt + j/m"

-- Insert --
	keymap("i", "jk", "<ESC>", opts)				-- replace esc with jk/kj
	keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
	keymap("v", "<", "<gv^", opts)
	keymap("v", ">", ">gv^", opts)

-- Move text up and down
	keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
	keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
	keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
	keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
	keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
	keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
	keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

