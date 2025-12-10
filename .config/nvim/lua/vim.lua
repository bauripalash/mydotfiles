--------------------------
------ VIM CONFIG
--------------------------
-------------------------
------- SHORTCUTS
-------------------------
local api = vim.api
local g = vim.g     -- Used as `let`
local opt = vim.opt -- Used as `set`
local cmd = vim.cmd

--local gdproject = io.open(vim.fn.getcwd()..'/project.godot', 'r')
--if gdproject then
--    io.close(gdproject)
--    vim.fn.serverstart './godothost'
--end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"nvim-tree/nvim-tree.lua",
	"stevearc/vim-arduino",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",
	"nvim-lualine/lualine.nvim",
	"nvim-tree/nvim-web-devicons",
	"sheerun/vim-polyglot",
	"https://git.sr.ht/~p00f/clangd_extensions.nvim",
	"nvim-treesitter/nvim-treesitter",
	"ziglang/zig.vim",
	"lommix/godot.nvim",
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"voldikss/vim-floaterm",
		keys = {
			{ "<F7>", "<cmd>FloatermNew<CR>", desc = "New Terminal" }
		},
	},
	{
		"akinsho/bufferline.nvim",
		tag = "v4.5.2",
		dependencies = { "nvim-tree/nvim-web-devicons" }
	},
	{
		"catppuccin/nvim",
		name = "catppuccin"

	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	},
	{
		"jim-at-jibba/micropython.nvim",
		dependencies = { "akinsho/toggleterm.nvim", "stevearc/dressing.nvim" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c",
					"go",
					"lua",
					"java",
					"vim",
					"python",
					"zig",
					"javascript",
					"typescript",
					"html",
					"gdscript",
					"godot_resource",
					"gdshader" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{
		"jim-at-jibba/micropython.nvim",
		dependencies = { "akinsho/toggleterm.nvim", "stevearc/dressing.nvim" },
	},
	{
	  "folke/todo-comments.nvim",
	  dependencies = { "nvim-lua/plenary.nvim" },
	  opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	  }
	},
	{
	  "terrastruct/d2-vim",
	  ft = { "d2" },
	},
	{
	  "ravsii/tree-sitter-d2",
	  dependencies = { "nvim-treesitter/nvim-treesitter" },
	  build = "make nvim-install",
	},
	"mfussenegger/nvim-jdtls",
}

require("lazy").setup(plugins)
require("Comment").setup()

local cmp = require("cmp")
local feedkeys = require("cmp.utils.feedkeys")


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
map("n", "<C-t>", ":NvimTreeToggle<CR>")
map("n", "<Leader>t", ":NvimTreeToggle<CR>")
map("v", "<Leader>n", ":NvimTreeFocus")
map("v", "<C-f>", ":NvimTreeFind")
map("v", "<F9>", "zf")

map("v", "<leader>xa", "<cmd>ArduinoAttach<CR>")
map("v", "<leader>xv", "<cmd>ArduinoVerify<CR>")
map("v", "<leader>xu", "<cmd>ArduinoUpload<CR>")
map("v", "<leader>xus", "<cmd>ArduinoUploadAndSerial<CR>")
map("v", "<leader>xus", "<cmd>ArduinoUploadAndSerial<CR>")
map("v", "<leader>xb", "<cmd>ArduinoChooseBoard<CR>")
map("v", "<leader>xp", "<cmd>ArduinoChooseProgrammer<CR>")

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>fr', '<cmd>Telescope lsp_references<cr>')
map('n', '<leader>fm', '<cmd>Telescope lsp_implementations<cr>')
map('n', '<leader>fd', '<cmd>Telescope lsp_definitions<cr>')
vim.keymap.set('n', '<leader>mr', require("micropython_nvim").run)



opt.encoding = "utf-8"
opt.mouse = "a"
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
--opt.background = "dark"
--opt.persistent_undo = true
-- I dont know how to these in Lua
--g.zig_fmt_autosave = 0

vim.diagnostic.config({virtual_text = true})

require("catppuccin").setup {
	term_colors = false,
	transparent_background = true,
	color_overrides = {
		mocha = {
			--base = "#000000",
			--mantle = "#000000",
			--crust = "#000000",
		},
	},
}

-- Dark Theme
vim.cmd.colorscheme "catppuccin-mocha"
-- Light Theme 
-- vim.cmd.colorscheme "catppuccin-latte"

local function my_on_attach(bufnr)
	local napi = require("nvim-tree.api")
	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	napi.config.mappings.default_on_attach(bufnr)
	vim.keymap.set('n', 't', napi.node.open.tab, opts('Open: New Tab'))
end

require("nvim-tree").setup({
	on_attach = my_on_attach,
})

require 'nvim-web-devicons'.setup({

})

--- require("bufferline").setup{
---
--- }
vim.api.nvim_set_option("clipboard", "unnamedplus")

--- light theme -> catppuccin-latte
--- dark theme -> catppuccin-mocha
cmd([[
	syntax enable
	if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
	  silent !mkdir ~/.vim/backups > /dev/null 2>&1
	  set undodir=~/.vim/backups
	  set undofile
	endif


	autocmd StdinReadPre * let s:std_in=1

	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

	au BufNewFile,BufRead *.v set filetype=vlang
	au BufNewFile,BufRead *.md setlocal textwidth=80
	au BufNewFile,BufRead *.d2 setfiletype d2
	au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc

]])

local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}
cmp.setup({
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			return vim_item
		end
	},
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
				feedkeys.call("<Plug>(vsnip-expand-or-jump)", "")
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
				feedkeys.call("<Plug>(vsnip-jump-prev)", "")
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

--require("navigator").setup({
--	lsp = {
--		disable_lsp = {'clang'},
--	}
--})
--vim.lsp.set_log_level("debug")
--vim.api.nvim_create_autocmd('LspAttach', {
--	  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--  callback = function(ev)
--   local client = vim.lsp.get_client_by_id(args.data.client_id)
--   print(client)
--   client.server_capabilities.semanticTokensProvider = nil
--  end,
-- })

local ok, godot = pcall(require, "godot")
if not ok then
	return
end

godot.setup()

----------------------------------
-- LANGUAGE SERVERS
-- -------------------------------

local lsp_caps = vim.lsp.protocol.make_client_capabilities()

local ard_caps = vim.lsp.protocol.make_client_capabilities()
ard_caps.textDocument.semanticTokens = vim.NIL
ard_caps.workspace.semanticTokens = vim.NIL


lsp_caps.textDocument.completion.completionItem.snippetSupport = true
local capabilities = require("cmp_nvim_lsp").default_capabilities(lsp_caps)
local clang_cap = require("cmp_nvim_lsp").default_capabilities(lsp_caps)
clang_cap.offsetEncoding = 'utf-8'

require("lspconfig")["rust_analyzer"].setup({
	capabilities = capabilities,
})

local function on_attach(client, bufnr)
	print(client.server_capabilities.semanticTokensProvider)
	client.server_capabilities.semanticTokensProvider = nil
end


g.zig_fmt_parse_errors = 0

vim.lsp.enable('intelephense')
vim.lsp.enable('jdtls')
vim.lsp.enable("zls");
vim.lsp.enable("gopls");
vim.lsp.enable("clangd");
vim.lsp.enable("basedpyright");
vim.lsp.enable("clojure_lsp");
vim.lsp.enable("dartls");
vim.lsp.enable("vls");
vim.lsp.enable("serve_d");
vim.lsp.enable("html");
vim.lsp.enable("cssls");
vim.lsp.enable("racket_langserver");
vim.lsp.enable("gdscript");
vim.lsp.enable("kotlin_language_server");
vim.lsp.enable("ts_ls");
vim.lsp.enable("gdscript");
vim.lsp.enable("gdscript");
vim.lsp.enable("gdscript");



require("lspconfig")["lua_ls"].setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT'
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = true,
				library = {
					vim.fn.globpath(vim.o.runtimepath, "api/library/"),
					vim.env.VIMRUNTIME,
					"${3rd}/love2d/library",
				},
				userThirdParty = {
					--"/home/palash/Games/addons",
				},
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
				--library = vim.api.nvim_get_runtime_file("", true)
			}
		})
	end,
	settings = {
		Lua = {

		},
	},
})


--			runtime = {
--				version = "LuaJIT",
--			},
--
--			diagnostic = {
--				globals = { "vim" },
--			},
--
--			workspace = {
--				library = vim.api.nvim_get_runtime_file("", true),
--				userThirdParty = {"/home/palash/Games/addons"}
--			},
--
--			telemetry = {
--				enable = false,
--			},
require("lualine").setup({
	options = {
		theme = "catppuccin",
		icons_enabled = true,
	},

	sections = {
		lualine_b = {
			{
				require("micropython_nvim").statusline,
				cond = package.loaded["micropython_nvim"] and require("micropython_nvim").exists,
			},
		},

	}
})
