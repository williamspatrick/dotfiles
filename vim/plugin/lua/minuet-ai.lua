if string.find(os.getenv("DOTFILES_SYSTEM") or "", "home") ~= nil then
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
        debounce = 600,  -- Increase to reduce costs and avoid rate limits
        provider_options = {
            openai_compatible = {
                api_key = "OPENROUTER_API_KEY",
                end_point = "https://openrouter.ai/api/v1/chat/completions",
                model = "qwen/qwen3-coder-30b-a3b-instruct",
                name = "Openrouter",
                optional = {
                    max_tokens = 128,
                    top_p = 0.9,
                    provider = {
                        -- Prioritize throughput for faster completion
                        sort = "throughput",
                    },
                },
            },
        },
    })
end
