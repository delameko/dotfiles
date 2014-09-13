set nocompatible
set encoding=utf-8
filetype off

" Change leader to space
let mapleader="\<Space>"

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Themes
    "Plugin 'Lokaltog/vim-distinguished'
    Plugin 'morhetz/gruvbox'
    "Plugin 'tomasr/molokai'
    "Plugin 'sickill/vim-monokai'

" Vundle
    Plugin 'gmarik/vundle'

" Airline
    Plugin 'bling/vim-airline'
        let g:airline#extensions#tabline#enabled=1
        let g:airline#extensions#tabline#buffer_nr_show=1
        let g:airline#extensions#tabline#fnamemod=':t'
        let g:airline_detect_modified=1
        let g:airline_detect_paste=1
        let g:airline_enable_branch=1
        let g:airline_enable_syntastic=1
        let g:airline_left_sep = ''
        let g:airline_right_sep = ''
        let g:airline_powerline_fonts=1
        let g:airline_theme='dark'

" CloseTag
    Plugin 'docunext/closetag.vim'
        autocmd FileType html,eruby let b:closetag_html_style=1

" Commentary
    Plugin 'tpope/vim-commentary'
        imap <D-/> gcc<CR>
        xmap <D-/> gc<CR>

" cSyntaxAfter
    Plugin 'cSyntaxAfter'
        autocmd! BufRead,BufNewFile,BufEnter *.{c,cpp,h,javascript} call CSyntaxAfter()

" ctrl-p
    Plugin 'kien/ctrlp.vim'

" Eclim
    " Plugin 'initrc/eclim-vundle'
    "     let g:EclimJavascriptValidate=0 " Disable Eclim's validation in favour of Syntastic
    "     let g:EclimLocateFileDefaultAction = 'edit'
    "     nnoremap <silent> <D-R> :LocateFile<CR>

" Expand Region
    Plugin 'terryma/vim-expand-region'
        vmap v <Plug>(expand_region_expand)
        vmap <C-v> <Plug>(expand_region_shrink)

" Indent Guides
    Plugin 'nathanaelkane/vim-indent-guides'
        if has("gui_running")
            let g:indent_guides_auto_colors=1
        else
            let g:indent_guides_auto_colors=0
            hi IndentGuidesOdd  ctermbg=233
            hi IndentGuidesEven ctermbg=234
        endif
        let g:indent_guides_color_change_percent=5
        let g:indent_guides_enable_on_vim_startup=1
        let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
        let g:indent_guides_start_level=2

" JavaScript Syntax
    Plugin 'jelera/vim-javascript-syntax'
        let g:used_javascript_libs = 'underscore,angularjs'

" JavaScript Library Syntax
    Plugin 'othree/javascript-libraries-syntax.vim'

" JSON Syntax
    Plugin 'elzr/vim-json'

" Neocomplcache
    Plugin 'Shougo/neocomplcache.vim'
        let g:neocomplcache_enable_at_startup = 1

" NERDTree
    Plugin 'scrooloose/nerdtree'
        let NERDTreeShowBookmarks=1
        let NERDTreeChDirMode=2
        let NERDTreeBookmarksFile=$HOME."/.vim/.NERDTreeBookmarks"
        let NERDTreeQuitOnOpen=0
        let NERDTreeShowHidden=1
        let NERDTreeIgnore=['\~$','\.swp$','\.git','\.hg','\.svn','\.bzr','\.DS_Store']
        nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

" snipMate
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'msanders/snipmate.vim'
    Plugin 'honza/vim-snippets'
"        let g:snips_trigger_key = '<S-tab>'
"        let g:snips_trigger_key_backwards = '<C-S-tab>'

" surround
    Plugin 'tpope/vim-surround'

" Syntastic
    Plugin 'scrooloose/syntastic'
        let g:syntastic_auto_loc_list=1   " Automatically show error log on save
        let g:syntastic_loc_list_height=3 " Only show three errors at a time.
        let g:syntastic_ignore_files=['[a-zA-Z0-9\-\_\.]+\.html$', '[a-zA-Z0-9\-\_\.]+\.view$']
        let g:syntastic_javascript_checkers=['jshint']
        let g:syntastic_jshint_conf='~/.jshintrc'
        let g:syntastic_mode_map={ 'mode': 'active', 'passive_filetypes': ['html', 'view'] }
        let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-", " proprietary attribute \"bb-" ]
        hi SyntasticError term=reverse ctermbg=40 ctermfg=37 gui=undercurl guisp=white
        hi SyntasticWarning term=reverse ctermbg=40 ctermfg=37 gui=undercurl guisp=white
        hi SyntasticErrorSign guifg=white guibg=red
        hi SyntasticWarningSign guifg=white guibg=purple

" Tern - JavaScript editing support - also install npm install -g git://github.com/ramitos/jsctags.git
    Plugin 'marijnh/tern_for_vim'

" YouCompleteMe
"    Plugin 'Valloric/YouCompleteMe'

filetype plugin indent on

syntax on
set background=dark
colorscheme gruvbox

" Custom filetypes
autocmd BufNewFile,BufRead *.view set filetype=html

" Change the colour paste column 80
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")

" Change the cursor in terminal so block in normal, underscore in insert
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Quick editing of .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Quick save
nnoremap <Leader>w :w<CR>

" Use semi-colon for commands
nnoremap ; :

" Clear the search highlights with <L>/
nmap <silent> <Leader>/ :nohlsearch<CR>

" Use w!! to sudo save an already opened file
cmap w!! w !sudo tee % >/dev/null

set acd                         " Auto-change to directory of file in buffer
set autoindent                  " Auto-indent
set autoread                    " Auto read a file after external changes
set autowriteall                " Auto write when leaving buffer
set backspace=indent,eol,start  " Allow backspace to work more like expected
set encoding=utf-8              " UTF-8
set expandtab                   " Expand tab characters to spaces
set exrc secure                 " enable per-directory secure .vimrc files
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

"
" autocmd BufWrite * if v:insertmode == 'i' | call feedkeys("\<C-\>\<C-n>") | endif

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

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

