return {
--	{'folke/which-key.nvim', lazy = false,},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {"nvim-tree/nvim-web-devicons",},
		config = function()
	    	require("nvim-tree").setup {}
		end,
    	},
    	
        {
       		'nvim-lualine/lualine.nvim',
        	dependencies = { 'nvim-tree/nvim-web-devicons' },
    	},
    	
    	{"CRAG666/code_runner.nvim"},
    	
    	{"folke/tokyonight.nvim"},
-----------------------------------------------------------------------------------    	
    	--{'folke/tokyonight.nvim'},
    	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'neovim/nvim-lspconfig'},
	
	{'hrsh7th/nvim-cmp'},		-- Autocompletion
	{'hrsh7th/cmp-nvim-lsp'},
	{'L3MON4D3/LuaSnip'},
}

