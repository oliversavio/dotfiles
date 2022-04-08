" Ensure autocmd works for Filetype
set shortmess-=F
"-----------------------------------------------------------------------------
" nvim-lsp Mappings
"-----------------------------------------------------------------------------
nnoremap <silent> gd          <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi          <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr          <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gds         <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gws         <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>rn  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>f   <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>ca  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>ws  <cmd>lua require'metals'.worksheet_hover()<CR>
nnoremap <silent> <leader>a   <cmd>lua require'metals'.open_all_diagnostics()<CR>
nnoremap <silent> <space>q    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> [c          <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>
nnoremap <silent> ]c          <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>

"-----------------------------------------------------------------------------
" nvim-lsp Settings
"-----------------------------------------------------------------------------
lua << EOF
local cmd = vim.cmd
cmd([[augroup lsp]])
cmd([[autocmd!]])
cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
-- NOTE: You may or may not want java included here. You will need it if you want basic Java support
-- but it may also conflict if you are using something like nvim-jdtls which also works on a java filetype
-- autocmd.
cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
cmd([[augroup end]])
EOF
"-----------------------------------------------------------------------------
" nvim-metals setup with a few additions such as nvim-completions
"-----------------------------------------------------------------------------
lua << EOF
metals_config = require("metals").bare_config()
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  serverVersion = "0.11.2",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
metals_config.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

EOF

autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c


