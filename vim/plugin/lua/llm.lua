if string.find(os.getenv("DOTFILES_SYSTEM") or "", "home") ~= nil then
    require("llm").setup({
        tokens_to_clear = { "<EOT>" },
        fim = {
            enabled = true,
            prefix = "<PRE> ",
            middle = " <MID>",
            suffix = " <SUF>",
        },
        model = "codellama/CodeLlama-13b-hf",
        context_window = 4096,
        tokenizer = {
            repository = "codellama/CodeLlama-13b-hf",
        },
        lsp = {
            bin_path = vim.api.nvim_call_function("stdpath", { "data" })
                .. "/mason/bin/llm-ls",
        },
        accept_keymap = "<S-CR>",
        dismiss_keymap = "<C-CR>",
    })
end
