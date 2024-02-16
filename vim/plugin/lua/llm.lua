if string.find(os.getenv("DOTFILES_SYSTEM") or "", "home") ~= nil then
    require("llm").setup({
        tokens_to_clear = { "<EOT>" },
        fim = {
            enabled = true,
            prefix = "<PRE> ",
            middle = " <MID>",
            suffix = " <SUF>",
        },
        model = "codellama/CodeLlama-7b-hf",
        -- backend = "ollama",
        -- url = "http://patrickw3-mbp.vulture-banana.ts.net:11434/api/generate",
        -- model = "codellama:7b-code",
        -- request_body = {
        --     options = {
        --         num_predict = 40,
        --     }
        -- },
        context_window = 4096,
        tokenizer = {
            repository = "codellama/CodeLlama-7b-hf",
        },
        lsp = {
            bin_path = vim.api.nvim_call_function("stdpath", { "data" })
                .. "/mason/bin/llm-ls",
        },
        accept_keymap = "<C-CR>",
        dismiss_keymap = "<C-Esc>",
    })
end
