local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require('user.lsp-config.language-servers')
require('user.lsp-config.emmet')
require('user.lsp-config.completion')
require('user.lsp-config.null-ls')
