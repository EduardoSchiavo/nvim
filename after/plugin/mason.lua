require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { 'pylsp', 'ts_ls', 'eslint', 'java_language_server', 'lua_ls', 'rust_analyzer', 'robotframework_ls' },
    handlers = {
        function(server_name)
            if server_name == 'pylsp' then
                require('lspconfig').pylsp.setup({
                    settings = {
                        pylsp = {
                            plugins = {
                                rope_autoimport = {
                                    enabled = true
                                }
                            }
                        }
                    }
                })
            else
                require('lspconfig')[server_name].setup({})
            end
        end,
    },
})
