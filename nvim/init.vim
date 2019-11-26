call plug#begin('~/.config/nvim/bundle')
" USEFUL

" comment plugin
Plug 'tpope/vim-commentary'

" brackets management
Plug 'machakann/vim-sandwich'

" WINDOW MANAGEMENT

" tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" winresizer
Plug 'simeji/winresizer'

" FILE MANAGEMENT
" nert-tree
Plug 'scrooloose/nerdtree'

" fzf plugin
Plug 'junegunn/fzf.vim'

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

" Coc Nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" nvim-remote
Plug 'mhinz/neovim-remote'

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

" random settings
set number
set clipboard=unnamed
set mouse=nvi
set smarttab
set visualbell
set virtualedit=block
set scrolloff=1
set wildmenu
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

" search for visual selection
vnoremap // y/<C-R>"<CR>

" Disable Backup and Swap files
set noswapfile
set nobackup
set nowritebackup

" setup split
set splitbelow
set splitright

" tabs
nnoremap <leader>t :tabnew<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" auto reload .vimrc on write
autocmd BufWritePost init.vim source %

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

" vimtex setup
let g:vimtex_compile_progname = 'nvr'

" colors.lua setup
lua require'colorizer'.setup()

" tmux setup
let g:tmuxcomplete#trigger = ''

" Coc vim setup
set hidden
set updatetime=300
set shortmess+=c
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" goto remaps
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `:Form` to format current buffer
command! -nargs=0 Form :call CocAction('format')

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>x  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbls
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action fo next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>
