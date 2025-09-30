return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
        -- mason-lspconfig has a 'auto-enable' feature; disable it, for more control
        -- see https://github.com/mason-org/mason-lspconfig.nvim?tab=readme-ov-file#automatically-enable-installed-servers
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "pyright", "bashls", "lua_ls", "ruff" },
                automatic_enable = false
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.general = capabilities.general or {} -- Ensure general table exists
			capabilities.general.positionEncodings = { "utf-16" } --, "utf-8", "utf-32" } -- Prioritize UTF-16

            -- using 'lspconfig = require("lspconfig")' etc. is deprecated, see :help lspconfig-nvim-0.11 
            vim.lsp.config("lua_ls",  { capabilities = capabilities })
            vim.lsp.config("bash_ls", { capabilities = capabilities })
            vim.lsp.config("pyright", { capabilities = capabilities })

            --local lspconfig = require("lspconfig")
			--lspconfig.lua_ls.setup( { capabilities = capabilities })
			--lspconfig.bashls.setup( { capabilities = capabilities })
			--lspconfig.pyright.setup({ capabilities = capabilities })
				--[[
                settings = {
                    pyright = {
                        -- Using Ruff's import organizer
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { "*" },
                        },
                    },
                },
                }) 
                ]]-- 

            -- see https://docs.astral.sh/ruff/editors/setup/#__tabbed_1_2
			--lspconfig.ruff.setup({})
			-- Disable hover: see https://hwisnu.bearblog.dev/neovim-config-ruff-linter-pyright-hover-info/
			local on_attach_ruff = function(client, _)
				if client.name == "ruff" then
					-- disable hover in favor of pyright
					client.server_capabilities.hoverProvider = false
				end
			end
			vim.lsp.config("ruff", {
				on_attach = on_attach_ruff,
				init_options = {
					settings = {
						["ruff"] = {}, -- Ruff language server settings go here
					},
				},
				capabilities = {
					general = {
						-- positionEncodings = { "utf-8", "utf-16", "utf-32" }  <--- this is the default
						positionEncodings = { "utf-16" },
					},
				},
			})
			vim.lsp.enable("ruff")
			-- If I call "lspconfig.lua_ls.setup" above, no need to enable (can be used to disable by setting the flag to "false")
            -- vim.lsp.enable("lua_ls", true) -- DEBUG

			-- see https://github.com/neovim/neovim/issues/33073
			vim.diagnostic.config({
				-- virtual_lines = true,
				virtual_text = true,
			})

			-- keymaps taken from: https://github.com/neovim/nvim-lspconfig (as suggested in https://www.youtube.com/watch?v=S-xzYgTLVJE&ab_channel=typecraft)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {}) -- to expand too long lsp warnings
		end,
	},
}
