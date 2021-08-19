-- Bootstrap packer.nvim.
local fn = vim.fn
local command = vim.api.nvim_command
local packer_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(packer_path)) > 0 then
  command('!git clone https://github.com/wbthomason/packer.nvim '..packer_path)
  command('packadd packer.nvim')
end

local packer = require('packer')
local util = require('packer.util')

-- Initialize packer.nvim.
packer.init({
  display = {
    open_fn = function()
      return util.float({
        border = 'single', height = math.ceil(vim.o.lines * 0.5)
      })
    end
  }
})

-- Plugins.
packer.startup(function()
  -----------------------------
  -- Self-manage packer
  -----------------------------
  use 'wbthomason/packer.nvim'

  -----------------------------
  -- Style plugins
  -----------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate',
    requires = {'nvim-treesitter/playground'},
    config = function()
      require('treesitter-config')
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function()
      require('indent-blankline-config')
    end
  }

  -----------------------------
  -- Behavior plugins
  -----------------------------
  use {
    'steelsojka/pears.nvim',
    config = function()
      require('pears-config')
    end
  }

  use {
    'tpope/vim-unimpaired',
    keys = {
      '[a', ']a',
      '[b', ']b',
      '[e', ']e',
      '[p', ']p',
      '[q', ']q',
      '[<Space>', ']<Space>'
    },
    config = function()
      require('unimpaired-config')
    end
  }

  -----------------------------
  -- Filesystem plugins
  -----------------------------
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    keys = {
      "''", "'.", "',", "'c", "'g", "'h", "'i", "']", "'/",
      "'r", "'w", "'W",
      "'ec", "'eh", "'ei", "'em", "'es", "'et", "'ev"
    },
    config = function()
      require('telescope-config')
    end
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  -----------------------------
  -- Development plugins
  -----------------------------
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('lsp-config')
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns-config')
    end,
    event = 'BufRead'
  }

  use {
    'hrsh7th/nvim-compe',
    event = 'InsertEnter',
    ft = {
      'css', 'dart', 'eruby', 'html', 'javascript', 'json', 'markdown', 'ruby',
      'scss'
    },
    config = function()
      require('compe-config')
    end
  }

  -----------------------------
  -- Misc plugins
  -----------------------------
  use {
    'norcalli/nvim-colorizer.lua',
    ft = {'css', 'json', 'lua', 'scss', 'vim'},
    config = function()
      require('colorizer-config')
    end,
  }

  -- Workaround for Neovim bug, see:
  --   https://github.com/neovim/neovim/issues/12587
  --   https://github.com/lambdalisue/fern.vim/issues/120
  use 'antoinemadec/FixCursorHold.nvim'
end)
