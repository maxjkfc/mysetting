" 設定 ~/.nvim 為設定檔路徑
set runtimepath^=~/.nvim
let &packpath = &runtimepath

"git push -u origin main 讀取套件包設定檔
source ~/.config/nvim/bundle.vim
" 讀取基本設定檔
source ~/.config/nvim/setting.vim

" 讀取套件配置檔

" Load the coc config
if filereadable(expand('~/.config/nvim/coc.vim'))
  source ~/.config/nvim/coc.vim
endif

