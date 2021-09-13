-- Bootstrap packer.nvim.
local fn = vim.fn
local command = vim.api.nvim_command
local packer_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(packer_path)) > 0 then
  command('!git clone https://github.com/wbthomason/packer.nvim '..packer_path)
  command('packadd packer.nvim')
end

-- Speed up loading of Lua modules. Note, this needs to happen BEFORE Lua
-- plugins are loaded.
require('impatient')

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
    'phaazon/hop.nvim',
    config = function()
      require('hop-config')
    end
  }

  use {
    'tpope/vim-unimpaired',
    keys = {'[', ']'},
    config = function()
      require('unimpaired-config')
    end
  }

  -----------------------------
  -- Fuzzy finding plugins
  -----------------------------
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    keys = {'<Space>'},
    config = function()
      require('telescope-config')
    end
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  -----------------------------
  -- Treesitter plugins
  -----------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate',
    config = function()
      require('treesitter-config')
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = '0.5-compat'
  }

  use {
    'nvim-treesitter/playground',
    cmd = 'TSHighlightCapturesUnderCursor'
  }

  -----------------------------
  -- Auto-completion plugins
  -----------------------------
  use {
    'hrsh7th/nvim-cmp',
    requires = {'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp'},
    config = function()
      require('cmp-config')
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('autopairs-config')
    end
  }

  use {
    -- Only use pear-tree to complete tags, instead use nvim-autopairs to
    -- complete most standard pairings (parentheses, quotes, etc).
    --
    -- Note, pear-tree does not play well with nvim-cmp when completing
    -- parentheses (for whatever reason). Hence, the limiting of pear-tree to
    -- tag-only complation.
    --
    -- Also, the nvim-ts-autotag plugin (a tag completion plugin by the same
    -- author as nvim-autopairs) does not currently support eRuby HTML templates
    -- because they are not Treesitter compatible (maybe one day). Hence, the
    -- on-going use of pear-tree, for now.
    'tmsvg/pear-tree',
    config = function()
      require('pear-tree-config')
    end
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
    end
  }

  use {
    'dense-analysis/ale',
    config = function()
      require('ale-config')
    end
  }

  use {
    'janko-m/vim-test',
    config = function()
      require('test-config')
    end
  }

  use {
    'hrsh7th/vim-vsnip',
    ft = {'dart', 'html', 'javascript', 'markdown', 'ruby'},
    config = function()
      require('vsnip-config')
    end
    -- ~/dotfiles/vim/vsnip - custom snippets
  }

  use {
    'tpope/vim-projectionist',
    config = function()
      require('projectionist-config')
    end
  }

  use {
    'editorconfig/editorconfig-vim',
    config = function()
      require('editorconfig-config')
    end
  }

  use 'dart-lang/dart-vim-plugin'

  use 'vim-crystal/vim-crystal'

  -----------------------------
  -- Misc plugins
  -----------------------------
  use 'lewis6991/impatient.nvim'

  use {
    'norcalli/nvim-colorizer.lua',
    ft = {'css', 'json', 'lua', 'markdown', 'scss', 'vim', 'yaml'},
    config = function()
      require('colorizer-config')
    end,
  }

  -- Workaround for Neovim bug, see:
  --   https://github.com/neovim/neovim/issues/12587
  use 'antoinemadec/FixCursorHold.nvim'
end)
