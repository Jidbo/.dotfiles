call plug#begin('~/.config/nvim/bundle')
" USEFUL
" Editor config
Plug 'editorconfig/editorconfig-vim'

" comment plugin
Plug 'tpope/vim-commentary'

" brackets management
Plug 'tpope/vim-surround'

" WINDOW MANAGEMENT

" tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" winresizer
Plug 'simeji/winresizer'

" goyo
Plug 'junegunn/goyo.vim'

" FILE MANAGEMENT
" nerd-tree
Plug 'scrooloose/nerdtree'

" fzf plugin
Plug 'junegunn/fzf.vim'

" vimwiki
Plug 'vimwiki/vimwiki'

" GIT STUFF
" git
Plug 'tpope/vim-fugitive'

" vim gitgutter
Plug 'airblade/vim-gitgutter'

" COLORS
" Plastic colorscheme
Plug 'aonemd/kuroi.vim'

" Color higlighting
Plug 'norcalli/nvim-colorizer.lua'

" powerline
Plug 'vim-airline/vim-airline'

" language packs
Plug 'sheerun/vim-polyglot'

" latex
Plug 'lervag/vimtex'

" All of your Plugins must be added before the following line
call plug#end()

" nvim setup
" syntax
syntax on
let mapleader=" "

" color settings
set termguicolors
colorscheme kuroi
set background=dark
hi MatchParen guibg=NONE guifg=red gui=bold

" random settings
set number
set clipboard=unnamed
set mouse=nvi
" set smarttab
set expandtab
set tabstop=4
set visualbell
set virtualedit=block
set scrolloff=1
set wildmenu
set autoread
set lazyredraw
set history=250
set noshowmode

" tabs and line wrap
set tabstop=4
set wrapmargin=8
set softtabstop=0 noexpandtab
set shiftwidth=4
set backspace=2
set backspace=indent,eol,start
set encoding=utf-8
set autoindent

" search
set incsearch
set hlsearch
set smartcase

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

" Disable Backup and Swap files
set noswapfile
set nobackup
set nowritebackup

" setup split
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

" auto reload .vimrc on write
autocmd BufWritePost init.vim source %

" toggle hybrid number mode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
nnoremap <silent> <Leader>bd :Bclose<CR>

" PLUGIN SETTINGS

" polyglot setup
let g:polyglot_disabled = ["latex"]
" nerd tree setup
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

map <leader>e :NERDTreeToggle<CR>

" AIRLINE SETUP
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

" gitgutter setup
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'
augroup VimDiff
	autocmd!
	autocmd VimEnter,FilterWritePre * if &diff | GitGutterDisable | endif
augroup END

" fzf setup
nmap <C-y> :Buffers<CR>
nmap <Leader>f :GFiles<CR>
let g:fzf_buffers_jump = 1

" Vimwiki setup
let g:vimwiki_list = [{'path': '~/.wiki/'}]

" vimtex setup
let g:vimtex_compile_progname = 'nvr'

" colors.lua setup
lua require'colorizer'.setup()

" tmux setup
let g:tmuxcomplete#trigger = ''

" GOYO
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

" Autocompletion
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
