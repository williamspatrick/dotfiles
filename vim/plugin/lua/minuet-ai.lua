if string.find(os.getenv("DOTFILES_SYSTEM") or "", "home") ~= nil then
    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = {
            "*.sops.yaml",
            "*.sops.yml",
            "*.sops.json",
            "*.sops.toml",
            ".sops.yaml",
            ".sops.yml",
            "*.enc.yaml",
            "*.enc.json",
            "*.secrets.yaml",
            "*.secrets.json",
            "*/secrets/*", -- files directly under any 'secrets' dir
            "*/secrets/**", -- any nested subdirectories
        },
        callback = function()
            vim.b.minuet_virtual_text_auto_trigger = false
        end,
    })
    require("minuet").setup({
        virtualtext = {
            auto_trigger_ft = { "*" },
            keymap = {
                accept = "<C-CR>",
                dismiss = "<C-Esc>",
                next = "<A-Right>",
                prev = "<A-Left>",
            },
        },
        provider = "openai_compatible",
        request_timeout = 2.5,
        throttle = 1500, -- Increase to reduce costs and avoid rate limits
        debounce = 600, -- Increase to reduce costs and avoid rate limits
        provider_options = {
            openai_compatible = {
                api_key = "OPENROUTER_API_KEY",
                end_point = "https://openrouter.ai/api/v1/chat/completions",
                model = "~deepseek/deepseek-v4-flash-latest",
                name = "Openrouter",
                optional = {
                    max_tokens = 128,
                    top_p = 0.9,
                    provider = {
                        -- Prioritize throughput for faster completion
                        sort = "throughput",
                    },
                    reasoning_effort = "none",
                },
                transform = {
                    function(opts)
                        opts.headers = opts.headers or {}
                        opts.headers["HTTP-Referer"] =
                            "https://github.com/milanglacier/minuet-ai.nvim"
                        opts.headers["X-OpenRouter-Title"] = "Neovim Minuet AI"
                        opts.headers["X-OpenRouter-Categories"] = "ide-extension"

                        return opts
                    end,
                },
            },
        },
    })
end
