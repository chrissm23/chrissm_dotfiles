-- [[ plug.lua ]]

return require('packer').startup(function(use)
    -- [[ Plugins Go Here ]]

    use { 'wbthomason/packer.nvim' } -- Packer can manage itself
    use { --filesystem navigation
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons' -- Filesystem icons
    }

    -- [[ Theme ]]
    use { 'goolord/alpha-nvim' } -- Startup screen
    use { 'rmagatti/auto-session' } -- Sessions for neovim
    use {  -- Session browser
        'rmagatti/session-lens',
        requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
    }
    use { 'nvim-telescope/telescope-ui-select.nvim' } -- set vim ui to telescope
    use { 'lukas-reineke/indent-blankline.nvim' } -- indentation line
    use { 'DanilaMihailov/beacon.nvim' } -- Cursor jump
    use {
        'nvim-lualine/lualine.nvim', --statusline
        requires = { 'kyazdani42/nvim-web-devicons',
            opt = true }
    }
    use({
        'rose-pine/neovim', -- Colorscheme
        as = 'rose-pine',
        -- config = function()
        --     vim.cmd('colorscheme rose-pine')
        -- end
    })

    -- [[ Dev ]]
    use {
        'nvim-telescope/telescope.nvim', -- Fuzzy finder
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-telescope/telescope-file-browser.nvim' -- File-browser telescope
    }
    use { 'dinhhuy258/git.nvim' } -- Git integration
    use { 'junegunn/gv.vim' } -- Commit history
    use { 'windwp/nvim-autopairs' } -- Auto close brackets, etc.
    use { 'mbbill/undotree' } -- Persistent undo
    use { 'kylechui/nvim-surround' } -- Surroundings
    use { 'terrortylor/nvim-comment' } -- Comment lines out
    use {
        'akinsho/bufferline.nvim', -- Buffer line with tabpage
        tag = 'v2.*',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use { 'lewis6991/gitsigns.nvim' } -- Symbols for git changes
    use { 'github/copilot.vim' } -- Github copilot

    -- LSP
    use { 'neovim/nvim-lspconfig' } -- Configuration for LSP

end)
