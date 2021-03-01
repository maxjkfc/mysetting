let s:bundle_dir = $HOME.'/.vim/bundle'
let g:plug_shallow = 0
let g:plug_window = 'enew'
let g:plug_pwindow = 'vertical rightbelow new'


" 設定 bundle 位置
call plug#begin(s:bundle_dir)
" Golang
  Plug 'fatih/vim-go', {'do':':GoUpdateBinaries' , 'for':'go'} 
" Theme 主題
  Plug 'dracula/vim',{'as':'dracula'}
" coc 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
" FZF 模糊搜尋插件
  Plug 'junegunn/fzf.vim' 
  Plug 'junegunn/fzf'

" Tools (必備)
  " 快速產生括弧插件
  Plug 'tpope/vim-sensible'
  " 快速選取區塊內容
  Plug 'gcmt/wildfire.vim'
  " 快速註解
  Plug 'scrooloose/nerdcommenter'
  " 新版 ctags"
  Plug 'liuchengxu/vista.vim'
  " git 插件 
  Plug 'tpope/vim-fugitive'
  " 多游標選取
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()
