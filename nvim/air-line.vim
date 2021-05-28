
  " 啟用 tabline 
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'default'

  " 預設主題
  let g:airline_theme='dracula'

  let g:airline_powerline_fonts=1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline_extensions = ['tagbar','coc','fzf','tabline']
  let g:airline#extensions#ale#enabled = 1

" coc
  let g:airline#extensions#coc#enabled = 1
  let airline#extensions#coc#error_symbol = 'E:'
  let airline#extensions#coc#warning_symbol = 'W:'
  let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
  let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

  let g:airline#extensions#capslock#enabled = 1
  let g:airline#extensions#csv#enabled = 1

  "fugitive
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#branch#vcs_priority = ["git"]
  let g:airline#extensions#branch#displayed_head_limit = 10
  let g:airline#extensions#branch#format = 2
  let g:airline#extensions#branch#sha1_len = 4
  let g:airline#extensions#branch#vcs_checks = ['untracked', 'dirty']
  " vista
  let g:airline#extensions#vista#currentag = 1
