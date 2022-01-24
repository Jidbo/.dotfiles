" PLUGIN OPTIONS

" GITGUTTER SETUP
" =========================
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'
augroup VimDiff
	autocmd!
	autocmd VimEnter,FilterWritePre * if &diff | GitGutterDisable | endif
augroup END

" VIMWIKI SETUP
" =========================
let g:vimwiki_list = [{'path': '~/.notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_hl_headers = 1
let g:vimwiki_listsyms = '    X'

" VIMTEX SETUP
" =========================

let g:vimtex_compiler_engine = 'lualatex'
let g:vimtex_quickfix_mode = 0
let g:tex_flavor = 'latex'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
	\ 'backend' : 'nvim',
	\ 'background' : 1,
	\ 'build_dir' : '',
	\ 'callback' : 1,
	\ 'continuous' : 1,
	\ 'executable' : 'latexmk',
	\ 'hooks' : [],
	\ 'options' : [ 
	\   '-pdflatex=lualatex',
	\   '-file-line-error',
	\   '-synctex=1',
	\   '-interaction=nonstopmode',
	\ ],
	\}

" COLORS.LUA SETUP
" =========================

lua require'colorizer'.setup()

" TMUX SETUP
" =========================

let g:tmuxcomplete#trigger = ''

" GOYO
" =========================

function! s:goyo_enter()
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  set showcmd
  set scrolloff=1
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

let g:goyo_width = 120
