-- local cmp_status, lsp_zero = pcall(require, "lsp-zero")
-- if not cmp_status then
--   return
-- end
local lsp_zero = require("lsp-zero")
lsp_zero.preset('recommended')
lsp_zero.setup()
