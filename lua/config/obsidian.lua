-- Obsidian (obsidian.nvim)
--
-- Sections:
--   1. Settings       paths and names you might want to change
--   2. Date helpers
--   3. Placeholders   the {{name}} values available in templates
--   4. Plugin setup
--   5. Auto-apply the template to new notes
--   6. Keymaps        <leader>o...

---------------------------------------------------------------------
-- 1. Settings
---------------------------------------------------------------------
local VAULT = "~/Documents/STIC"
local NOTES_DIR = "notes" -- new notes go here (relative to the vault)
local DAILY_NAME = "daily-notes"
local DAILY_DIR = NOTES_DIR .. "/" .. DAILY_NAME
local TEMPLATES_DIR = "0/templates"
local DAILY_TEMPLATE = "daily-nvim.md"
local NEW_NOTE_TEMPLATE = "new-note-nvim.md"
local DATE_FORMAT = "%Y-%m-%d"

local vault_path = vim.fn.expand(VAULT)

---------------------------------------------------------------------
-- 2. Date helpers
---------------------------------------------------------------------
-- fixed English names, so the tag doesn't depend on the Windows language
local MONTHS = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" }

local function ts(y, m, d)
	return os.time({ year = y, month = m, day = d, hour = 12 })
end

local function fmt(format, y, m, d)
	return os.date(format, ts(y, m, d))
end

local function today()
	local t = os.date("*t")
	return t.year, t.month, t.day
end

-- returns a (y, m, d) function that formats the date, e.g. date_part("%A")
local function date_part(format)
	return function(y, m, d)
		return fmt(format, y, m, d)
	end
end

-- matches moment's "ww" in the en locale: weeks start Sunday, week 1 contains Jan 1
local function moment_week(y, m, d)
	local yday0 = os.date("*t", ts(y, m, d)).yday - 1
	local jan1 = os.date("*t", ts(y, 1, 1)).wday - 1
	return math.floor((yday0 + jan1) / 7) + 1
end

-- date of the note being created (read from its id), else today
local function note_date(ctx)
	local id = ctx and ctx.partial_note and ctx.partial_note.id
	local y, m, d = tostring(id or ""):match("^(%d%d%d%d)-(%d%d)-(%d%d)")
	if not y then
		return today()
	end
	return tonumber(y), tonumber(m), tonumber(d)
end

-- value of a property in the previous day's daily note ("" if missing)
local function prev_day_property(key, y, m, d)
	local path = ("%s/%s/%s.md"):format(vault_path, DAILY_DIR, fmt(DATE_FORMAT, y, m, d - 1))
	local f = io.open(path, "r")
	if not f then
		return ""
	end
	local value = ""
	for line in f:lines() do
		local v = line:match("^" .. key .. ":%s*(.*)$")
		if v then
			value = v
			break
		end
	end
	f:close()
	return value
end

---------------------------------------------------------------------
-- 3. Placeholders
---------------------------------------------------------------------
-- wrap a (y, m, d) function so it works as a template placeholder
local function for_note(f) -- dated by the note's own filename
	return function(ctx)
		return f(note_date(ctx))
	end
end

local function for_today(f) -- always dated today
	return function()
		return f(today())
	end
end

local substitutions = {
	-- daily notes
	date_dayname = for_note(date_part("%A")),
	date_month_name = for_note(date_part("%B")),
	date_week = for_note(function(y, m, d)
		return tostring(moment_week(y, m, d))
	end),
	year_prior = for_note(function(y, m, d)
		return fmt(DATE_FORMAT, y - 1, m, d)
	end),
	note_prev = for_note(function(y, m, d)
		return fmt(DATE_FORMAT, y, m, d - 1)
	end),
	note_next = for_note(function(y, m, d)
		return fmt(DATE_FORMAT, y, m, d + 1)
	end),
	tag_month = for_note(function(y, m)
		return ("%d/%s"):format(y, MONTHS[m])
	end),
	exercises_week = for_note(function(y, m, d)
		return prev_day_property("daily_exercises_week", y, m, d)
	end),
	fasting_week = for_note(function(y, m, d)
		return prev_day_property("fasting_week", y, m, d)
	end),

	-- new notes
	new_daily_note = for_today(date_part(DATE_FORMAT)),
	new_dayname = for_today(date_part("%A")),
	new_week = for_today(function(y, m, d)
		return tostring(moment_week(y, m, d))
	end),
}

---------------------------------------------------------------------
-- 4. Plugin setup
---------------------------------------------------------------------
-- named note: keep the name. untitled note: timestamp.
local function note_id(title)
	if title ~= nil and title ~= "" then
		return (title:gsub('[<>:"/\\|?*]', "")) -- strip characters Windows doesn't allow
	end
	return os.date("%Y-%m-%d-T%H%M%S")
end

require("obsidian").setup({
	legacy_commands = false, -- this will be removed in 4.0.0
	frontmatter = { enabled = false }, -- don't auto-add id / aliases / tags
	workspaces = {
		{ name = "personal", path = VAULT },
	},

	note_id_func = note_id,
	new_notes_location = "notes_subdir",
	notes_subdir = NOTES_DIR,

	daily_notes = {
		folder = DAILY_DIR,
		date_format = DATE_FORMAT,
		template = DAILY_TEMPLATE,
	},
	templates = {
		folder = TEMPLATES_DIR,
		substitutions = substitutions,
	},
})

---------------------------------------------------------------------
-- 5. Auto-apply the template to new notes
---------------------------------------------------------------------
-- fills empty notes in notes/ (daily notes have their own template)
local notes_glob = (vault_path .. "/" .. NOTES_DIR):gsub("\\", "/") .. "/*.md"

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	pattern = notes_glob,
	callback = function(ev)
		if ev.file:find(DAILY_NAME, 1, true) then
			return
		end
		vim.schedule(function()
			if vim.api.nvim_get_current_buf() ~= ev.buf then
				return
			end
			local lines = vim.api.nvim_buf_get_lines(ev.buf, 0, -1, false)
			if #lines == 1 and lines[1] == "" then
				vim.cmd("Obsidian template " .. NEW_NOTE_TEMPLATE)
			end
		end)
	end,
})

---------------------------------------------------------------------
-- 6. Keymaps
---------------------------------------------------------------------
-- { key, :Obsidian subcommand, description }  ->  <leader>o<key>
local commands = {
	{ "n", "new", "New note" },
	{ "t", "today", "Today's note" },
	{ "y", "yesterday", "Yesterday's note" },
	{ "m", "tomorrow", "Tomorrow's note" },
	{ "d", "dailies", "Pick a daily note" },
	{ "f", "quick_switch", "Find note" },
	{ "s", "search", "Search notes" },
	{ "b", "backlinks", "Backlinks" },
	{ "l", "links", "Links in this note" },
	{ "g", "tags", "Find by tag" },
	{ "r", "rename", "Rename note" },
	{ "T", "template", "Insert template" },
	{ "i", "paste_img", "Paste image" },
	{ "o", "open", "Open in Obsidian app" },
}
for _, c in ipairs(commands) do
	-- vim.keymap.set("n", "<leader>o" .. c[1], "<cmd>Obsidian " .. c[2] .. "<cr>", { desc = "obsd: " .. c[3] })
	vim.keymap.set("n", "<leader>o" .. c[1], "<cmd>Obsidian " .. c[2] .. "<cr>", { desc = c[3] })
end

-- these two work on a visual selection
vim.keymap.set("v", "<leader>ok", ":Obsidian link<cr>", { desc = "obsd: Link selection" })
vim.keymap.set("v", "<leader>oe", ":Obsidian extract_note<cr>", { desc = "obsd: Extract to new note" })
