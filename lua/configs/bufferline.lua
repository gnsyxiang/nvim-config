

require("bufferline").setup({
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "center",
                separator = true
            }
        },
    },
})

local utils = require("utils")

local function opts(tbl)
    tbl = tbl or {}

    if tbl.desc then
        tbl.desc = 'bufferline: ' .. tbl.desc
    end

    return tbl
end

utils.keymap("n", "<Tab>",          "<cmd>BufferLineCycleNext<CR>",         opts{desc = "next"})
utils.keymap("n", "<S-Tab>",        "<cmd>BufferLineCyclePrev<CR>",         opts{desc = "prev"})
utils.keymap("n", "<leader>bn",     "<cmd>BufferLineCycleNext<CR>",         opts{desc = "next"})
utils.keymap("n", "<leader>bN",     "<cmd>BufferLineCyclePrev<CR>",         opts{desc = "prev"})

utils.keymap("n", "<leader>bp",     "<cmd>BufferLinePick<CR>",              opts{desc = "pick"})
utils.keymap("n", "<leader>bc",     "<cmd>BufferLinePickClose<CR>",         opts{desc = "close"})

utils.keymap("n", "<leader>bse",    "<cmd>BufferLineSortByExtension<CR>",   opts{desc = ""})
utils.keymap("n", "<leader>bsd",    "<cmd>BufferLineSortByDirectory<CR>",   opts{desc = ""})

-- 关闭除此外的所有buffer
utils.keymap("n", "<leader>ba",     "<cmd>BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", opts{desc = "close other buffer, except self"})

-- utils.keymap("n", "<leader>1",      "<cmd>BufferLineGoToBuffer 1<CR>",      opts{desc = ""})
-- utils.keymap("n", "<leader>2",      "<cmd>BufferLineGoToBuffer 2<CR>",      opts{desc = ""})
-- utils.keymap("n", "<leader>3",      "<cmd>BufferLineGoToBuffer 3<CR>",      opts{desc = ""})
-- utils.keymap("n", "<leader>4",      "<cmd>BufferLineGoToBuffer 4<CR>",      opts{desc = ""})
-- utils.keymap("n", "<leader>5",      "<cmd>BufferLineGoToBuffer 5<CR>",      opts{desc = ""})
-- utils.keymap("n", "<leader>6",      "<cmd>BufferLineGoToBuffer 6<CR>",      opts{desc = ""})
-- utils.keymap("n", "<leader>7",      "<cmd>BufferLineGoToBuffer 7<CR>",      opts{desc = ""})
-- utils.keymap("n", "<leader>8",      "<cmd>BufferLineGoToBuffer 8<CR>",      opts{desc = ""})
-- utils.keymap("n", "<leader>9",      "<cmd>BufferLineGoToBuffer 9<CR>",      opts{desc = ""})

