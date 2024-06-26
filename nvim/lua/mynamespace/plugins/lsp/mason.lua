local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"lua_ls",
		"astro",
		"gopls",
		"rust_analyzer",
		"dockerls",
		"html",
		"cssls",
		"tailwindcss",
		"prismals",
		"emmet_ls",
		"pyright",
	},
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		"rustfmt", -- rust fmt
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
