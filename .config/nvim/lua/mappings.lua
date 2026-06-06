require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- map("n", "<leader>e", "<cmd> NvimTreeToggle <cr>")
map("n", "<leader>e", "<cmd> Oil <cr>")

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })

map("n", "gd", vim.lsp.buf.definition, { desc = "LSP definition" })

map("n", "<leader>ds", vim.diagnostic.open_float, { desc = "LSP diagnostic" })

map("n", "<leader>ra", vim.lsp.buf.rename, { desc = "LSP rename" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
map("n", "<leader>cc", "<cmd> Compile <cr>")

map("v", "J", ":m '>+1<CR>gv=gv") -- Shift visual selected line down

map("v", "K", ":m '<-2<CR>gv=gv") -- Shift visual selected line up

map("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Snacks: Smart Find Files" })
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Snacks: Find Files" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Snacks: Buffers" })
map("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Snacks: Projects" })
map("n", "<leader>fw", function() Snacks.picker.grep() end, { desc = "Snacks: Grep (Live)" })
map("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Snacks: Help Tags" })
map("n", "<leader>ot", function() Snacks.terminal.toggle() end, { desc = "Snacks: Toggle Terminal" })

-- toogleterm

map("n", "<leader>tf", "<cmd>ToggleTerm<cr>", { desc = "Toggle big float terminal" })
map("t", "<leader>tf", "<cmd>ToggleTerm<cr>", { desc = "Toggle big float terminal" })
