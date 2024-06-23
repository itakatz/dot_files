return {
    {
       -- cmp sources plugins
       "hrsh7th/cmp-nvim-lsp",
       "hrsh7th/cmp-buffer",
       "hrsh7th/cmp-path"
       --"hrsh7th/cmp-nvim-lua",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        -- see some info here: https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
        "hrsh7th/nvim-cmp",
        config = function()
            --vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    -- available keywords: 
                    --  "priority" sets the order in the completion list (without it, the order here is used)
                    --  "keyword_length" how many characters needed to start the query
                    -- NOTE grouping does not seem to work, comment it out
                    --{
                    { name = 'nvim_lsp' }, --option = {keyword_length = 1} },
                    { name = 'luasnip' },  --option = {keyword_length = 2} }, -- For luasnip users.
                    { name = 'buffer' },   --option = {keyword_length = 2} },
                        --{ name = 'nvim_lua' },
                    { name = 'path' },
                    -- { name = 'vsnip' }, -- For vsnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                })
            })
        end
    }
}
