-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'navarasu/onedark.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use('mg979/vim-visual-multi', { branch = 'maser' })
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })


	use({
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"williamboman/nvim-lsp-installer",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"stevearc/conform.nvim",
	})

	use 'aschrab/feline.nvim'
	use("rose-pine/neovim", { name = "rose-pine" })

	use "lewis6991/gitsigns.nvim"
	use 'nvim-tree/nvim-web-devicons'
	use("folke/trouble.nvim", { cmd = "Trouble" })
end)
