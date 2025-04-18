require("nvim-tree").setup()

require("which-key").add({
    {
        "<leader>ft",
        require("nvim-tree.api").tree.toggle,
        desc = "Tree Toggle",
    },
})
