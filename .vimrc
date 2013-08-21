runtime bundle/pathogen/autoload/pathogen.vim

call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

colorscheme molokai
set background=dark

" Change the colour paste column 80
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")

" Change the cursor in terminal so block in normal, underscore in insert
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let mapleader=","               " Change leader to comma

" Use semi-colon for commands
nnoremap ; :

" Clear the search highlights with <L>/
nmap <silent> <Leader>/ :nohlsearch<CR>

" Use w!! to sudo save an already opened file
cmap w!! w !sudo tee % >/dev/null

set acd                         " Auto-change to directory of file in buffer
set autoindent
set autoread                    " Auto read a file after external changes
set autowriteall                " Auto write when leaving buffer
set encoding=utf-8
set expandtab                   " Expand tab characters to spaces
set formatoptions=ql            " q - allow formatting of comments with :gq
                                " l - don't format already long lines
set hidden                      " Allow buffers to be hidden without saving
set history=1000                " remember more commands and search history
set ignorecase                  " Case insensitive
set incsearch                   " Show match for partly typed searches
set laststatus=2                " Always display the statusline in all windows
set list listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set nobackup                    " No backup, use git
set noshowmode                  " Hide the default mode text
set noswapfile
set nowrap                      " Don't wrap lines
set number numberwidth=5        " Show line number.
set scrolloff=10                " Show number of lines around the cursor
set shiftwidth=2                " Number of spaces inserted for indentation
set showcmd                     " Show command as you type
set showmatch                   " Show matching brackets
set smartindent
set softtabstop=2               " Backspace treats spaces like tabs
set splitbelow                  " Create horizontal splits below the current one
set splitright                  " Create vertical splits to the right of current
set t_Co=256
set tabstop=2
set undodir=~/.vim/undodir
set undofile
set undolevels=1000             " Use many muchos levels of undo
set ws                          " Search commands wrap the end of buffer

" NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeBookmarksFile=$HOME."/.vim/.NERDTreeBookmarks"
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
nmap <leader>nt :NERDTree<CR>

" Airline
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
" if has("gui_running")
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
" else
"   let g:airline_left_sep = '▶'
"   let g:airline_right_sep = '◀'
"  let g:airline_branch_prefix = '⎇ '
"  let g:airline_readonly_symbol = 'Þ'
" endif
let g:airline_powerline_fonts=1
let g:airline_theme='dark'

" Indent Guides plugin
let g:indent_guides_auto_colors=1
let g:indent_guides_color_change_percent=5
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_start_level=2

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Write all files when focus lost
autocmd FocusLost * silent! wa

" Return to command mode when losing focusCK RIGHT-POINTING POINTER
autocmd FocusLost,TabLeave  * call LeaveInsertMode()
function! LeaveInsertMode()
  if v:insertmode == 'i' | call feedkeys("\<C-\>\<C-n>") | endif
endfunction

" Highlight cursor line, but only in the active pane.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" enables :Paste to just do what you want
command! Paste execute 'set paste | insert | set nopaste'

" shift-tab for unindent
map <Tab> >>
map <S-Tab> <<
"imap <Tab> <Esc>>>i
"imap <S-Tab> <Esc><<i

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Fast insert escape
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
