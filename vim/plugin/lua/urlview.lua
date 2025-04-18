local urlview = require("urlview")
urlview.setup()

require("which-key").add({
    { "<leader>fu", urlview.search, desc = "URLView" },
})
