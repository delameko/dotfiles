set nocompatible
set encoding=utf-8
set shell=/bin/zsh

" Change leader to space, must set it before plugins, incase the plugins use leader
nnoremap <Space> <Nop>
let mapleader=" "

" Plugins begin
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Alchemist.vim (elixir)
Plug 'slashmili/alchemist.vim'
  " Point to elixir source
  let g:alchemist#elixir_erlang_src = "/usr/local/share/src"
  " Disable semi-tag functionality
  "let g:alchemist_tag_disable = 1
  " Shortcuts
  "let g:alchemist_tag_map = '<C-]>'
  "let g:alchemist_tag_stack_map = '<C-T>'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Gruvbox
Plug 'morhetz/gruvbox'
  let g:gruvbox_contrast_dark='hard'

" Indent Guides
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

" NERDTree
Plug 'scrooloose/nerdtree'
  let NERDTreeBookmarksFile=$HOME."/.vim/.NERDTreeBookmarks"
  let NERDTreeChDirMode=1
  let NERDTreeIgnore=['\~$','\.swp$','\.git','\.hg','\.svn','\.bzr','\.idea','\.DS_Store']
  let NERDTreeMinimalUI=1
  let NERDTreeMouseMode=1
  let NERDTreeQuitOnOpen=0
  let NERDTreeRemoveDirCmd='trash '
  let NERDTreeRemoveFileCmd='trash '
  let NERDTreeShowBookmarks=1
  let NERDTreeShowHidden=1
  let NERDTreeShowLineNumbers=0
  let NERDTreeWinPos='right'
  let NERDTreeWinSize=30
  nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
  " autocmd vimenter * NERDTree

" Syntastic
Plug 'scrooloose/syntastic'
  let g:syntastic_auto_loc_list=1   " Automatically show error log on save
  let g:syntastic_loc_list_height=3 " Only show three errors at a time.
  let g:syntastic_ignore_files=['[a-zA-Z0-9\-\_\.]+\.html$', '[a-zA-Z0-9\-\_\.]+\.view$']

  let g:syntastic_enable_elixir_checker=1
  let g:syntastic_javascript_checkers=['eslint']
  " let g:syntastic_jshint_conf='~/.jshintrc'
  " let g:syntastic_ruby_checkers=['rubocop']
  let g:syntastic_scss_checkers=['scss_lint']

  let g:syntastic_mode_map={ 'mode': 'active', 'passive_filetypes': ['html', 'view'] }
  let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-", " proprietary attribute \"bb-" ]
  hi SyntasticError term=reverse ctermbg=41 ctermfg=37 gui=undercurl guisp=white
  hi SyntasticWarning term=reverse ctermbg=40 ctermfg=37 gui=undercurl guisp=white
  hi SyntasticErrorSign guifg=white guibg=red
  hi SyntasticWarningSign guifg=white guibg=purple

" surround
Plug 'tpope/vim-surround'

" YouCompleteMe
Plug 'Valloric/YouCompleteMe'
  silent! py3 pass " Temporary fix for python3 deprecation warning
  "let g:ycm_server_python_interpreter='/usr/local/bin/python'

" Plugins end
call plug#end()

filetype plugin indent on

syntax on
set background=dark
colorscheme gruvbox
" hi Normal ctermfg=254 ctermbg=234
hi IndentGuidesOdd  ctermbg=234
hi IndentGuidesEven ctermbg=235

" Custom filetypes
autocmd BufNewFile,BufRead *.view set filetype=html

" Change the colour paste column 80
highlight ColorColumn ctermbg=233 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")

" Change the cursor in terminal so block in normal,
" line in insert
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Quick editing of .vimrc
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" Quick save
nnoremap <Leader>w :w<CR>

" Insert a newline in command mode, without entering insert mode
" The m` preserves line position.
nmap <C-S-O> m`O<Esc>``
nmap <C-O> m`o<Esc>``

" Quick save nnoremap <Leader>w :w<CR>
" Close buffer without closing split
nmap <silent> <Leader>bd :bp\|bd #<CR>

" Use semi-colon for commands
nnoremap ; :

" Clear the search highlights with <L>/
" nmap <silent> <Leader>/ :nohlsearch<CR>
" Clear the search highlights when hitting esc
nnoremap <silent> <esc> :noh<cr><esc>

" Use w!! to sudo save an already opened file
cmap w!! w !sudo tee % >/dev/null

set autoindent                  " Auto-indent
set autoread                    " Auto read a file after external changes
set autowriteall                " Auto write when leaving buffer
set backspace=indent,eol,start  " Allow backspace to work more like expected
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
set noswapfile                  " No swap, what does it give me other than complaints
set noshowmode                  " Hide the default mode text
set nostartofline               " Stop the cursor moving to the start of the line when switching buffers
set nowrap                      " Don't wrap lines
set number numberwidth=5        " Show line number.
set scrolloff=0                 " Show number of lines around the cursor
set shiftwidth=2                " Number of spaces inserted for indentation
set showcmd                     " Show command as you type
set showmatch                   " Show matching brackets
set smartindent                 " Is it smart?  Really?
set softtabstop=2               " Backspace treats spaces like tabs
set splitbelow                  " Create horizontal splits below the current one
set splitright                  " Create vertical splits to the right of current
set t_Co=256                    " Set 256 colours
set tabstop=2                   " Tab stop
set ttyfast                     " Speed up screen updates in large files
set undodir=~/.vim/undodir      " Where to save the undo file
set undofile                    " Save undos to a file, so they persist
set undolevels=1000             " Use many levels of undo
set wildmenu                    " Enable command completion in the command line
set wildmode=list:longest,full  " Auto complete to the longest match
set ws                          " Search commands wrap the end of buffer

" Automatically cd into the directory that the file is in
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Replace tabs with spaces on save
autocmd BufRead,BufWrite * if ! &bin | silent! :retab | endif

" Write all files when focus lost or switch tab
"autocmd FocusLost,WinLeave * silent! :wa

" Exit insertmode on save or focus lost
"autocmd BufWrite,FocusLost * if v:insertmode == 'i' | call feedkeys("\<C-\>\<C-n>") | endif

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

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Fast insert escape
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

nnoremap <silent> <ESC>OA <UP>
nnoremap <silent> <ESC>OB <DOWN>
nnoremap <silent> <ESC>OC <RIGHT>
nnoremap <silent> <ESC>OD <LEFT>
inoremap <silent> <ESC>OA <UP>
inoremap <silent> <ESC>OB <DOWN>
inoremap <silent> <ESC>OC <RIGHT>
inoremap <silent> <ESC>OD <LEFT>

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

