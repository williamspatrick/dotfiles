local nvim_notify = require("notify")

nvim_notify.setup({
    stages = "slide",
    timeout = 2000,
})

-- Workaround https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428 .
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end
    nvim_notify(msg, ...)
end
