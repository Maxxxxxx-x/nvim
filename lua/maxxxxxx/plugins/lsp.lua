return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
        "j-hui/fidget.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local fzf = require("fzf-lua")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        require("fidget").setup({})

        local lsp_attach_group = vim.api.nvim_create_augroup("lsp-attach", { clear = true })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = lsp_attach_group,
            callback = function(event)
                local function map(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                -- Navigation (fzf-lua handles definition/references/etc)
                map("gd", function()
                    fzf.lsp_definitions()
                end, "[G]oto [D]efinition")
                map("gr", function()
                    fzf.lsp_references()
                end, "[G]oto [R]eferences")
                map("gI", function()
                    fzf.lsp_implementations()
                end, "[G]oto [I]mplementation")
                map("<leader>D", function()
                    fzf.lsp_typedefs()
                end, "Type [D]efinition")
                map("<leader>ds", function()
                    fzf.lsp_document_symbols()
                end, "[D]ocument [S]ymbols")

                -- Documentation & Help
                map("K", vim.lsp.buf.hover, "Hover Documentation")
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                map("<leader>vws", vim.lsp.buf.workspace_symbol, "Workspace Symbol")
                map("<leader>h", vim.lsp.buf.signature_help, "Signature Help")

                -- Diagnostics
                map("<leader>vd", vim.diagnostic.open_float, "Open Diagnostic Float")
                map("[d", vim.diagnostic.goto_prev, "Go to Previous Diagnostic")
                map("]d", vim.diagnostic.goto_next, "Go to Next Diagnostic")

                -- Actions
                map("<leader>vca", vim.lsp.buf.code_action, "Code Action")
                map("<leader>vrn", vim.lsp.buf.rename, "Rename Symbol")
            end,
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "lua_ls",
                "ts_ls",
                "gopls",
                "pyright",
                "svelte",
                "tailwindcss",
                "sqls",
            },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                ["svelte"] = function()
                    lspconfig.svelte.setup({
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" } },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),
                                    checkThirdParty = false,
                                },
                                telemetry = { enable = false },
                                completion = { callSnippet = "Both" },
                                format = { enable = false },
                            },
                        },
                    })
                end,

                ["pyright"] = function()
                    lspconfig.pyright.setup({
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = { extraPaths = { "." } },
                            },
                        },
                    })
                end,

                ["tailwindcss"] = function()
                    lspconfig.tailwindcss.setup({
                        capabilities = capabilities,
                        settings = {
                            tailwindCSS = {
                                experimental = {
                                    classRegex = {
                                        "tw`([^`]*)",
                                        'tw="([^"]*)',
                                        "tw\\.\\w+`([^`]*)",
                                    },
                                },
                            },
                        },
                    })
                end,
            },
        })

        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        })
    end,
}
