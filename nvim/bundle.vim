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

call plug#end()
