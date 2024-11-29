vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true

vim.wo.relativenumber = true



-- FOR NVIM TREE PLUGIN
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ================ MAPS ===================
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>te', '<cmd>Template template<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>y', '<cmd>%y+<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>P', '<cmd>!g++ -std=c++17 -O2 -Wall -DUSACO_IO % -o %:r<CR>', { noremap = true, silent = true })

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})
-- =================== PLUGIN ==================

local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy', 'lazy.nvim')
lazy.opts = {}

lazy.setup({
	{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{'glepnir/template.nvim', cmd = {'Template','TemProject'}, config = function()
    require('template').setup({
		 temp_dir = 'C:/Users/usser/AppData/Local/nvim/templates',
   	 author = 'zebnel',
	    email = 'zeballosaldunateleonel@gmail.com',
    })
end},
	{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  },
  {
	  'nvim-treesitter/nvim-treesitter',
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
	 {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
	 {'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  ---@type solarized.config
  opts = {},},
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {"zaldih/themery.nvim",
  	lazy = false,
  },

})


-- =================== PLUGIN CONFIG ===============
-- Default options:

require('solarized').setup({
  transparent = {
    enabled = false,
    pmenu = true,
    normal = true,
    normalfloat = true,
    neotree = true,
    nvimtree = true,
    whichkey = true,
    telescope = true,
    lazy = true,
  },
  on_highlights = nil,
  on_colors = nil,
  palette = 'solarized', -- solarized (default) | selenized
  variant = 'winter', -- "spring" | "summer" | "autumn" | "winter" (default)
  error_lens = {
    text = false,
    symbol = false,
  },
  styles = {
    enabled = true,
    types = {},
    functions = {},
    parameters = {},
    comments = {},
    strings = {},
    keywords = {},
    variables = {},
    constants = {},
  },
  plugins = {
    treesitter = true,
    lspconfig = true,
    navic = true,
    cmp = true,
    indentblankline = true,
    neotree = true,
    nvimtree = true,
    whichkey = true,
    dashboard = true,
    gitsigns = true,
    telescope = true,
    noice = true,
    hop = true,
    ministatusline = true,
    minitabline = true,
    ministarter = true,
    minicursorword = true,
    notify = true,
    rainbowdelimiters = true,
    bufferline = true,
    lazy = true,
    rendermarkdown = true,
    ale = true,
    coc = true,
    leap = true,
    alpha = true,
    yanky = true,
    gitgutter = true,
  },
})

-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'solarized',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Minimal config
require("themery").setup({
  themes = {
	{
    name = "Solarized",
    colorscheme = "solarized",
	 before = [[
      vim.o.background = "light"
    ]],
  },
  {
    name = "Gruvbox Light",
    colorscheme = "gruvbox",
	 before = [[
      vim.o.background = "light"
    ]],
  },
	{
    name = "Gruvbox Dark",
    colorscheme = "gruvbox",
	 before = [[
      vim.o.background = "dark"
    ]],
  },
	{
    name = "Catpuccin Latte",
    colorscheme = "catppuccin",
	 before = [[
      vim.o.background = "light"
    ]],
  },
	{
    name = "Catpuccin Mocha",
    colorscheme = "catppuccin",
	 before = [[
      vim.o.background = "dark"
    ]],
  },

  }, -- Your list of installed colorschemes.
  livePreview = true, -- Apply theme while picking. Default to true.
})

vim.opt.termguicolors = true
--vim.o.background = "light"  -- For light themes
--vim.cmd.colorscheme('solarized')

require("bufferline").setup{}
require("nvim-tree").setup()
