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

" fzf
nmap <C-y> :Buffers<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>l :Lines<CR>

" vim fugitive
nnoremap <leader>gg :G<cr>

" neo formatter
nnoremap <leader>p :Neoformat<CR>

" goyo mapping
nnoremap <silent> <leader>w :Goyo<CR>

" spelling
nnoremap <silent> <leader>se :set spell spelllang=en<CR>
nnoremap <silent> <leader>sd :set spell spelllang=de<CR>

" lsp mappings
imap <silent> <c-p> <Plug>(completion_trigger)

nnoremap <silent> gd  <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gD  <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gs  <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr  <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR  <cmd>lua vim.lsp.buf.rename()<CR>
