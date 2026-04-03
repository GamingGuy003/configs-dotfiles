return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			rust_analyzer = {
				settings = {
					rust_analyzer = {
						procMacro = { enabled = true },
					},
				},
			},
			bashls = {},
			cssls = {},
			fish_lsp = {},
			lua_ls = {},
			markdown_oxide = {},
			pylsp = {},
			superhtml = {},
			tailwindcss = {},
			docker_compose_language_service = {},
			docker_language_server = {},
			vtsls = {
				settings = {
					typescript = {
						updateImportsOnRename = "always",
						suggest = {
							completeFunctionCalls = true,
						},
					},
					javascript = {
						updateImportsOnRename = "always",
						suggest = {
							completeFunctionCalls = true,
						},
					},
				},
			},
			sqlls = {},
			texlab = {
				settings = {
					texlab = {
						build = {
							executable = "latexmk",
							args = { "-pdf", "-interaction=nonstopmode", "%f" },
							onSave = true,
						},
						chktex = { onOpenAndSave = true },
					},
				},
			},
		},
	},
}
