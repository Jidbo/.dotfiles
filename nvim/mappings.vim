" REMAPS
" search for visual selection
vnoremap // y/<C-R>"<CR>
nnoremap H ^

" ex command 
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" auto expand brackets
inoremap (; (<CR>)<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>}<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>]<C-c>O
inoremap [, [<CR>],<C-c>O

" toggle hybrid mode
nnoremap <leader>h :set rnu!<CR>

" nerdtree
map <leader>e :NERDTreeToggle<CR>

" Telescope
nnoremap <C-y> <cmd>Telescope buffers<CR>
nnoremap <leader>f <cmd>Telescope find_files<CR>
nnoremap <leader>l <cmd>Telescope live_grep<CR>
nnoremap <silent> gD  <cmd>Telescope lsp_implementations<CR>
nnoremap <silent> gH  <cmd>Telescope lsp_code_actions<CR>
nnoremap <silent> gd  <cmd>Telescope lsp_definitions<CR>
nnoremap <silent> gr  <cmd>Telescope lsp_references<CR>
nnoremap <silent> gy  <cmd>Telescope treesitter<CR>

" vim fugitive
nnoremap <leader>gg :G<cr>

" neo formatter
nnoremap <leader>p :Neoformat<CR>

" goyo mapping
nnoremap <silent> <leader>w :Goyo<CR>

" spelling
nnoremap <silent> <leader>se :set spell spelllang=en<CR>
nnoremap <silent> <leader>sd :set spell spelllang=de<CR>

" nnoremap <silent> gd  <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh  <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gH  <cmd>lua vim.lsp.buf.code_action()<CR>
" nnoremap <silent> gD  <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gs  <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> gr  <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR  <cmd>lua vim.lsp.buf.rename()<CR>
