local harpoon = require("harpoon")
harpoon:setup()
local map = vim.keymap.set

map("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Harpoon: add file" })

map("n", "<leader>m", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon: menu" })

map("n", "<leader>1", function()
	harpoon:list():select(1)
end, { desc = "Harpoon: file 1" })

map("n", "<leader>2", function()
	harpoon:list():select(2)
end, { desc = "Harpoon: file 2" })

map("n", "<leader>3", function()
	harpoon:list():select(3)
end, { desc = "Harpoon: file 3" })

map("n", "<leader>4", function()
	harpoon:list():select(4)
end, { desc = "Harpoon: file 4" })

map("n", "<leader>5", function()
	harpoon:list():select(5)
end, { desc = "Harpoon: file 5" })

map("n", "<leader>6", function()
	harpoon:list():select(6)
end, { desc = "Harpoon: file 6" })

map("n", "<leader>7", function()
	harpoon:list():select(7)
end, { desc = "Harpoon: file 7" })

map("n", "<leader>8", function()
	harpoon:list():select(8)
end, { desc = "Harpoon: file 8" })

map("n", "<leader>9", function()
	harpoon:list():select(9)
end, { desc = "Harpoon: file 9" })

map("n", "<leader>]", function()
	harpoon:list():next()
end, { desc = "Harpoon: next" })
map("n", "<leader>[", function()
	harpoon:list():prev()
end, { desc = "Harpoon: prev" })
