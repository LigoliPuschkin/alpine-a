require('code_runner').setup({
  filetype = {
      javascript = "node",
      java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
      kotlin = "cd $dir && kotlinc-native $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt.kexe",
      c = {
        "cd $dir",
        "gcc $fileName -o",
        "/tmp/$fileNameWithoutExt &&",
        "/tmp/$fileNameWithoutExt &&",
        "rm /tmp/$fileNameWithoutExt",
      },
      cpp = {
--	"echo start: ",
	"ls &&",
	"echo &&",
	"cd $dir &&",
	"ls &&",
	"echo &&",
	"echo &&",
	"g++ $fileName",
        "-o $fileNameWithoutExt &&",
	"echo compiling done: &&",
	"echo ==================================================== &&",
	"echo &&",
	"echo &&",
	"echo &&",
	"./$fileNameWithoutExt",
	
--	"g++ -o lab21 $fileName"
--	"./lab21"
--      "cd $dir &&",
--      "g++ $fileName",
--      "-o /tmp/$fileNameWithoutExt &&",
--      "/tmp/$fileNameWithoutExt",
      
      },
      python = "python -u '$dir/$fileName'",
      sh = "bash",
      typescript = "deno run",
      typescriptreact = "yarn dev$end",
      rust = "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
      dart = "dart",
      cs = function(...)
        local root_dir = require("null-ls.utils").root_pattern "*.csproj"(vim.loop.cwd())
        return "cd " .. root_dir .. " && dotnet run$end"
      end,
    },
-- appeance    ============================================================================
    mode = 'tab',
      -- startinsert (see ':h inserting-ex')
      startinsert = false,
      term = {
        --  Position to open the terminal, this option is ignored if mode ~= term
        position = "bot",
        -- window size, this option is ignored if tab is true
        size = 8,
      },
      float = {
        -- Window border (see ':h nvim_open_win')
        border = "none",

        -- Num from `0 - 1` for measurements
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,

        -- Highlight group for floating window/border (see ':h winhl')
        border_hl = "FloatBorder",
        float_hl = "Normal",

        -- Transparency (see ':h winblend')
        blend = 0,
      },
--      filetype_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/code_runner.nvim/lua/code_runner/code_runner.json",
     -- filetype = {},
--      project_path = vim.fn.stdpath("data")
 --         .. "/site/pack/packer/start/code_runner.nvim/lua/code_runner/project_manager.json",
      --project = {},
  })
 
