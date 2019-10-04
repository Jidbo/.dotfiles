set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" USEFUL
" comment plugin
Plugin 'tpope/vim-commentary'

" brackets management
Plugin 'machakann/vim-sandwich'

" snippets
Plugin 'SirVer/ultisnips'

" WINDOW MANAGEMENT
" tmux navigator
Plugin 'christoomey/vim-tmux-navigator'

" winresizer
Plugin 'simeji/winresizer'

" FILE MANAGEMENT
" nert-tree
Plugin 'scrooloose/nerdtree'

" fzf plugin
Plugin 'junegunn/fzf.vim'

" GIT STUFF
" git
Plugin 'tpope/vim-fugitive'

" vim gitgutter
Plugin 'airblade/vim-gitgutter'

" COLORS
" color schemes
Plugin 'flazz/vim-colorschemes'

" powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" LANGUAGE SUPPORT
" vim ale for interaction with language servers
Plugin 'w0rp/ale'

" editorconfig plugin
Plugin 'editorconfig/editorconfig-vim'

" language packs
Plugin 'sheerun/vim-polyglot'

" latex
Plugin 'lervag/vimtex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" syntax
syntax on
colorscheme Benokai
let mapleader=" "

" random settings
set number
set clipboard=unnamed
set mouse=nvi
set smarttab
set visualbell
set virtualedit=block
set scrolloff=1
set wildmenu
set term=screen-256color
set autoread
set lazyredraw
set history=250

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

" Disable Backup and Swap files
set noswapfile
set nobackup
set nowritebackup

" setup split
set splitbelow
set splitright

" tabs
nnoremap <leader>t :tabnew<CR>
nnoremap <C-n> gT
nnoremap <C-p> gt

" search for visual selection
vnoremap // y/<C-R>"<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" remap code folding
nnoremap <leader>g za

" auto reload .vimrc on write
autocmd BufWritePost .vimrc source %

" ex command 
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" toggle hybrid number mode
nnoremap <leader>h :set rnu!<CR>
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" auto expand brackets
inoremap (; (<CR>)<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>}<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>]<C-c>O
inoremap [, [<CR>],<C-c>O

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
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
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

" vim-ale setup
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = {
\	'*': ['trim_whitespace'],
\	'python': ['autopep8']
\ }
nmap <Leader>d :ALEGoToDefinition<CR>
nmap <Leader>r :ALEFindReferences<CR>
nmap <Leader>b :ALEFix<CR>
nnoremap <space>l :lnext<CR>
nnoremap <space>p :lprevious<CR>

" UltiSnip setup

" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/snipps"]
