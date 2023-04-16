--------------------------
------ VIM CONFIG
--------------------------

-------------------------
------- SHORTCUTS
-------------------------
local api = vim.api
local g = vim.g -- Used as `let`
local opt = vim.opt -- Used as `set`
local cmd = vim.cmd

local packer = require("packer")
local cmp = require("cmp")
-----
-------------------------
------- PLUGINS
-------------------------
cmd([[ packadd packer.nvim ]])
packer.startup(function(use)
	use("wbthomason/packer.nvim")
--	use("dracula/vim")
	use("preservim/nerdtree")
	use("ryanoasis/vim-devicons")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
--	use("ollykel/v-vim")
--	use("sam4llis/nvim-tundra")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-web-devicons")
--	use("dart-lang/dart-vim-plugin")
--	use("thosakwe/vim-flutter")
--	use("folke/tokyonight.nvim")
--	use("morhetz/gruvbox")
--	use("udalov/kotlin-vim")
	use("NLKNguyen/papercolor-theme")
	use("pineapplegiant/spaceduck")
	use("sheerun/vim-polyglot")
	use("github/copilot.vim")
	use("https://git.sr.ht/~p00f/clangd_extensions.nvim")
end)

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	api.nvim_set_keymap(mode, lhs, rhs, options)
end

g.mapleader = ","
g.maplocalleader = "\\"

-- inoremap <F9> <C-O>za
-- nnoremap <F9> za
-- onoremap <F9> <C-C>za
-- vnoremap <F9> zf
map("i", "<F9>", "<C-O>za")
map("n", "<F9>", "za")
map("o", "<F9>", "<C-C>za")
map("v", "<F9>", "zf")
map("n", "<C-t>", ":NERDTreeToggle<CR>")
map("n", "<Leader>t", ":NERDTreeToggle<CR>")
map("v", "<Leader>n", ":NERDTreeFocus")
map("v", "<C-f>", ":NERDTreeFind")
map("v", "<F9>", "zf")

opt.encoding = "utf-8"
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.backup = false
opt.number = true
opt.autoread = true
--opt.t_Co = 256
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.termguicolors = true
opt.incsearch = true
--opt.nowb = true
opt.backspace = "indent,eol,start"
opt.timeoutlen = 1000
opt.colorcolumn = "80"
opt.modeline = true
--background for gruvbox
opt.background="light"
--opt.persistent_undo = true
-- I dont know how to these in Lua

cmd([[ 
	syntax enable 
	if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
	  silent !mkdir ~/.vim/backups > /dev/null 2>&1
	  set undodir=~/.vim/backups
	  set undofile
	endif
    colorscheme spaceduck


	autocmd StdinReadPre * let s:std_in=1

	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
	
	au BufNewFile,BufRead *.v set filetype=vlang
]])

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			--    elseif has_words_before() then
			--      cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

----------------------------------
-- LANGUAGE SERVERS
-- -------------------------------

local lsp_caps = vim.lsp.protocol.make_client_capabilities()

lsp_caps.textDocument.completion.completionItem.snippetSupport = true

local capabilities = require("cmp_nvim_lsp").default_capabilities(lsp_caps)

require("lspconfig")["rust_analyzer"].setup({
	capabilities = capabilities,
})
require("lspconfig")["gopls"].setup({
	capabilities = capabilities,
})
--require("lspconfig")["clangd"].setup({
--	capabilities = capabilities,
--})
require("clangd_extensions").setup{
	server = {
		capabilities = capabilities,
	}
}

--require("lspconfig")["ccls"].setup({
--	capabilities = capabilities,
--})

require("lspconfig")["pyright"].setup({
	capabilities = capabilities,
})

require("lspconfig")["zls"].setup({
	capabilities = capabilities,
})

require("lspconfig")["clojure_lsp"].setup({
	capabilities = capabilities,
})

require("lspconfig")["dartls"].setup({
	capabilities = capabilities,
})

require("lspconfig")["vls"].setup({
	capabilities = capabilities,
})
require("lspconfig")["html"].setup({
	capabilities = capabilities,
})

require("lspconfig")["cssls"].setup({
	capabilities = capabilities,
})

--require("lspconfig")["eslint"].setup({
--	capabilities = capabilities,
--})

--require("lspconfig")["denols"].setup({
--	capabilities = capabilities,
--})

require('lspconfig')['tsserver'].setup({
	capabilities = capabilities,
})

require("lspconfig")["racket_langserver"].setup({
	capabilities = capabilities,
})

require("lspconfig")["kotlin_language_server"].setup({
	capabilities = capabilities,
})

require("lspconfig")["lua_ls"].setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},

			diagnostic = {
				globals = { "vim" },
			},

			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},

			telemetry = {
				enable = false,
			},
		},
	},
})

require("lualine").setup({
	options = {
		theme = "spaceduck",
		icons_enabled = true,
	},
})
