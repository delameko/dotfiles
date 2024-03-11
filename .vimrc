set nocompatible
set encoding=utf-8
set shell=/bin/zsh

" Change the leader to <Space>.  Must be set before plugins, in case the plugins
" use the leader keybind.
nnoremap <Space> <Nop>
let mapleader=" "

" Plugins begin
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" need to setup statusline before plugins, in case they append values
set statusline=\ %f\ [%l:%c]

call plug#begin()

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Commentary - comment stuff out
"   gcc - comment out line, takes a count
"   gc  - comment out in visual mode
Plug 'tpope/vim-commentary'

" Dispatch
Plug 'tpope/vim-dispatch'
  autocmd FileType elixir let b:dispatch='mix test %'

" Gruvbox - theme
Plug 'morhetz/gruvbox'
  let g:gruvbox_contrast_dark='hard'

" Indent Guides - colors indents
Plug 'nathanaelkane/vim-indent-guides'
  if has("gui_running")
    let g:indent_guides_auto_colors=1
  else
    let g:indent_guides_auto_colors=0
  endif
  let g:indent_guides_color_change_percent=5
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
  let g:indent_guides_start_level=2

" Polyglot - a collection language filetypes
Plug 'sheerun/vim-polyglot'

" Surround - modify surrounding elements
"   examples:
"     cs"' will replace double quotes with single quotes
"     ds( will delete the parenthesis
Plug 'tpope/vim-surround'

" Syntastic - check file syntax
Plug 'scrooloose/syntastic'
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list=1
  let g:syntastic_auto_loc_list=1 " Automatically show error log on save
  let g:syntastic_check_on_open=1
  let g:syntastic_check_on_wq=0
  let g:syntastic_loc_list_height=3 " Only show three errors at a time.
  let g:syntastic_ignore_files=['[a-zA-Z0-9\-\_\.]+\.html$', '[a-zA-Z0-9\-\_\.]+\.view$']

  let g:syntastic_enable_elixir_checker=1
  let g:syntastic_elixir_checkers=['elixir']
  let g:syntastic_javascript_checkers=['eslint']
  let g:syntastic_scss_checkers=['scss_lint']

  let g:syntastic_mode_map={ 'mode': 'active', 'passive_filetypes': ['html', 'view'] }
  let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-", " proprietary attribute \"bb-" ]
  hi SyntasticError term=reverse ctermbg=41 ctermfg=37 gui=undercurl guisp=white
  hi SyntasticWarning term=reverse ctermbg=40 ctermfg=37 gui=undercurl guisp=white
  hi SyntasticErrorSign guifg=white guibg=red
  hi SyntasticWarningSign guifg=white guibg=purple

" Vim-Test
Plug 'vim-test/vim-test'
  let test#elixir#exunit#file_pattern = '[\.|_]test\.exs'
  let test#enabled_runners=["elixir#exunit"]
  let test#strategy="dispatch"
  nmap <silent> <C-r> :TestFile<CR>
  nmap <silent> <C-r><C-r> :TestNearest<CR>
  "nmap <silent> <M-R><M-R> :TestSuite<CR>

" vinegar.vim - upgrades for netrw
"   -   : go up a level
"   I   : view extra details
"   .   : prepopulate : command with current file
"   y.  : to yank absolute path of file under cursor
"   ~   : go home, you drunk
"   C-^ : back to previous buffer
Plug 'tpope/vim-vinegar'

" Plugins end
call plug#end()

filetype on " enable filetype detection
filetype indent on " enable custom indents for filetype
filetype plugin on " enable loading plugins for the given filetype

" syntax coloring
syntax on
set background=dark
colorscheme gruvbox

" change the background color after column 80
hi ColorColumn ctermbg=233 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")

" change the cursor to be block in normal mode; line in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" quick editing of .vimrc
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" quick save
nnoremap <Leader>w :w<CR>

" close buffer without closing split
nmap <silent> <Leader>bd :bp\|bd #<CR>

" clear search highlights when hitting esc
nnoremap <silent> <esc> :noh<cr><esc>

" use w!! to sudo save a file your user doesn't have permission to change
cmap w!! w !sudo tee % >/dev/null

" settings
set autoindent                  " a new line starts at the indentation of the
                                "   previous one
set autoread                    " Auto read a file after external changes
set autowriteall                " Auto write when leaving buffer
set backspace=indent,eol,start  " Allow backspace to work more like expected
set cmdheight=2                 " increase message space
set expandtab                   " Expand tab characters to spaces
set exrc secure                 " enable per-directory secure .vimrc files
set foldmethod=manual           " manual folding
set formatoptions=ql            " q - allow formatting of comments with :gq
                                " l - don't format already long lines
set hidden                      " Allow buffers to be hidden without saving
set history=1000                " remember more commands and search history
set ignorecase                  " Case insensitive
set incsearch                   " Show match for partly typed searches
set laststatus=2                " Always display the statusline in all windows
set lazyredraw                  " Buffer screen updates
set list listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set modelines=0                 " Disable modelines, don't use them anyway
set mouse=a                     " Mouse support
set nobackup                    " No backup, use git
set nofoldenable                " Disable folding
set noswapfile                  " No swap, what does it give me other than
                                "   complaints
set noshowmode                  " Hide the default mode text
set nostartofline               " Stop the cursor moving to the start of the
                                "   line when switching buffers
set nowrap                      " Don't wrap lines
set nowritebackup               " Don't create a session backup
set number numberwidth=5        " Show line number
set scrolloff=0                 " Show number of lines around the cursor
set shiftwidth=2                " Number of spaces inserted for indentation
set shortmess+=c                " don't pass messages to ins-completion-menu
set showcmd                     " Show command as you type
set showmatch                   " Show matching brackets
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number         " merge signcolumn and number column
else
  set signcolumn=yes
endif
set softtabstop=2               " Backspace treats spaces like tabs
set splitbelow                  " Create horizontal splits below the current one
set splitright                  " Create vertical splits to the right of current
set t_Co=256                    " Set 256 colours
set tabstop=2                   " Tab stop
set termguicolors               " enable 24 bit color
set ttyfast                     " Speed up screen updates in large files
set undodir=~/.vim/undodir      " Where to save the undo file
set undofile                    " Save undos to a file, so they persist
set undolevels=1000             " Use many levels of undo
set updatetime=300              " reduce update time from 4000
set wildmenu                    " Enable command completion in the command line
set wildmode=list:longest,full  " Auto complete to the longest match
set ws                          " Search commands wrap the end of buffer

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Replace tabs with spaces on save
autocmd BufRead,BufWrite * if ! &bin | silent! :retab | endif

" Highlight cursor line, but only in the active pane.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" enables :Paste to just do what you want
command! Paste execute 'set paste | insert | set nopaste'

" shift-tab for indent, shift-alt-tab for unindent
vmap <S-Tab> >> <ESC>
vmap <S-A-Tab> << <ESC>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" fix the arrow keys, so they work as expected
nnoremap <silent> <ESC>OA <UP>
nnoremap <silent> <ESC>OB <DOWN>
nnoremap <silent> <ESC>OC <RIGHT>
nnoremap <silent> <ESC>OD <LEFT>
inoremap <silent> <ESC>OA <UP>
inoremap <silent> <ESC>OB <DOWN>
inoremap <silent> <ESC>OC <RIGHT>
inoremap <silent> <ESC>OD <LEFT>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" use local config, if it exists
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

