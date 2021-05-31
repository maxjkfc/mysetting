let s:bundle_dir = $HOME.'/.vim/bundle'
let g:plug_shallow = 0
let g:plug_window = 'enew'
let g:plug_pwindow = 'vertical rightbelow new'


" 設定 bundle 位置
call plug#begin(s:bundle_dir)

" Golang
  Plug 'fatih/vim-go', {'do':':GoUpdateBinaries' , 'for':'go'} 

" Theme
  Plug 'dracula/vim',{'as':'dracula'}

" coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
" FZF
  Plug 'junegunn/fzf.vim' 
  Plug 'junegunn/fzf'

" 快速註解
  Plug 'preservim/nerdcommenter'
" 快速加入括號
  Plug 'tpope/vim-sensible'

" 快速顯示大綱
  Plug 'liuchengxu/vista.vim' 

" 狀態列美化
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

" CSV
  Plug 'chrisbra/csv.vim'
" multi cursor
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()
