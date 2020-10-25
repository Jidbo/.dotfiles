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
