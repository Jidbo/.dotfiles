" PLUGIN OPTIONS

" NERD TREE SETUP
" =========================

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

map <leader>e :NERDTreeToggle<CR>

" AIRLINE SETUP
" =========================

" sections
let g:airline_section_y = ""
let g:airline_section_z = "%l/%L:%c"
let g:airline_section_b = "%{airline#util#wrap(airline#extensions#branch#get_head(),0)}"
" other stuff
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
let g:airline_inactive_collapse=1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#keymap#enabled = 0
set ttimeoutlen=50

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

" FZF SETUP
" =========================

nmap <C-y> :Buffers<CR>
nmap <Leader>f :GFiles<CR>
let g:fzf_buffers_jump = 1

" VIMWIKI SETUP
" =========================

let g:vimwiki_list = [{'path': '~/.wiki/'}]

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

let g:goyo_linenr = 0

" AUTOCOMPLETION
" =========================

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-rename)
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ULTISNIPS SETUP
" =========================

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/snipps"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" EMMET SETUP
" =========================

let g:user_emmet_leader_key='<C-i>'

" LANGUAGETOOL SETUP
" =========================
" autocmd Filetype tex LanguageToolSetUp
let g:languagetool_cmd='/usr/bin/languagetool'
