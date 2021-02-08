" Set the shell 設定Shell 環境
    set shell=/bin/zsh
" Base 基礎設定 
    set clipboard=unnamed     	" 可將vim 內容複製至系統剪貼簿上
    filetype plugin indent on 	" 自動決定檔案類型.
    set mouse=a               	" 啟動滑鼠功能
    set mousehide             	" 在輸入模式時，隱藏滑鼠指標
    set encoding=utf-8	    	" 使用 utf8 編碼
    scriptencoding utf-8    	" 腳本使用 utf8 編碼
    
    set shortmess+=filmnrxoOtT              		" Abbrev. Of messages (avoids 'hit enter')
    set shortmess+=c
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore                 		" 允許游標移動到最後一個字元
    set history=1000                        		" 提高歷史指令儲存至 1000 
    set hidden                              		" 允許 buffer 在切換時不用強制儲存 Allow buffer switching without saving
    set backup                              		" 啟動備份功能
    set writebackup		                 			" 啟動寫入時備份
    set undofile                                    " So is persistent undo ...
    set undolevels=1000                             " Maximum number of changes that can be undone
    set undoreload=10000                            " Maximum number lines to save for undo on a buffer reload

" GUI 
    syntax on                 " Syntax highlighting
    colorscheme dracula 
    "
    set background=dark             " Assume a dark background
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    " 加速移動
    set lazyredraw
    "
    highlight clear SignColumn      " Sign Column should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    set ruler                       " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                     " Show partial commands in status line and

    set laststatus=2
    "set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code

" Formatting
    set nowrap                              " Do not wrap long lines
    set smartindent
    set shiftwidth=2                        " Use indents of 4 spaces
    set expandtab                           " Tabs are spaces, not tabs
    set tabstop=4                           " An indentation every four columns
    set softtabstop=4                       " Let backspace delete indent
    set nojoinspaces                        " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                          " Puts new vsplit windows to the right of the current
    set splitbelow                          " Puts new split windows to the bottom of the current
    set autoindent                          
    
    set directory=~/.vimswp/
    set backupdir=~/.vimbackup
    set undodir=~/.vimundo


    set list lcs=tab:\|\ 


" Key Mappings
    let mapleader =','          " set the key map leader
    let maplocalleader = '_'

    " Easier Moving
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$
    "To clear search highlighting rather than toggle
    nmap <silent> <leader>/ :nohlsearch<CR>

     " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

     " Some helpers to edit mode
    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%
    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    " settings for resize splitted window
    nmap w[ :vertical resize -3<CR>
    nmap w] :vertical resize +3<CR>

    nmap w- :resize -3<CR>
    nmap w= :resize +3<CR>
