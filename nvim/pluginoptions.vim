" PLUGIN OPTIONS

" NERD TREE SETUP
" =========================

let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree
let NERDTreeChDirMode=2
highlight Directory guifg=#D1D5DB ctermfg=blue
highlight NERDTreeHelp guifg=#4B5563 ctermfg=gray
highlight NERDTreeCWD guifg=#9CA3AF ctermfg=gray
highlight NERDTreeFlags guifg=#4B5563 ctermfg=green
highlight NERDTreeExecFile guifg=#DC2626 ctermfg=green


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
let g:fzf_buffers_jump = 1

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

let g:goyo_linenr = 0

" AUTOCOMPLETION
" =========================
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.intelephense.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.vuels.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.pylsp.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.texlab.setup{ on_attach=require'completion'.on_attach }
lua <<EOF
  lspconfig = require "lspconfig"
  lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }
EOF

set completeopt=menuone,noinsert,noselect
set shortmess+=c


" EMMET SETUP
" =========================
let g:user_emmet_leader_key='<C-i>'

" LANGUAGETOOL SETUP
" =========================
" autocmd Filetype tex LanguageToolSetUp
let g:languagetool_cmd='/usr/bin/languagetool'

" TREESITTER
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "maintained",
"   highlight = {
"     enable = true,
"   },
"   indent = {
"     enable = true
"   },
" }
" EOF
