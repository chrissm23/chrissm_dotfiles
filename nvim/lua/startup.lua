-----------------------------------------------------------
-- Dashboard configuration file
-----------------------------------------------------------

local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
    return
end

local dashboard = require('alpha.themes.dashboard')

-- Footer
local function footer()
    local version = vim.version()
    local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
    local datetime = os.date('%d/%m/%Y %H:%M:%S')

    return print_version .. ' - ' .. datetime
end

-- Banner
local banner = {
"    _,--._.-,",
"   /\\_r-,\\_ )",
".-.) _;='_/ (.;",
" \\ \\'     \\/S )",
"  L.'-. _.'|-'",
" <_`-'\\'_.'/",
"   `'-._( \\",
"    ___   \\\\,      ___",
"    \\ .'-. \\\\   .-'_. /",
"     '._' '.\\\\/.-'_.'",
"        '--``\\('--'",
"              \\\\",
"              `\\\\,",
"                \\|",
}

dashboard.section.header.val = banner

-- Menu
dashboard.section.buttons.val = {
    dashboard.button('e', ' New file', ':ene <BAR> startinsert<CR>'),
    dashboard.button('<leader> fh', ' Recent Files', ':Telescope oldfiles<CR>'),
    dashboard.button('<leader> fb', ' File Browser', ':Telescope file_browser<CR>'),
    dashboard.button('<leader> lg', ' Find Word', ':Telescope live_grep<CR>'),
    dashboard.button('<leader> sl', ' Open Last Session', ':RestoreSession<CR>'),
    dashboard.button('<leader> sf', ' Open Session', ':Telescope session-lens search_session<CR>'),
    dashboard.button('q', ' Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
