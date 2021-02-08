if isdirectory(expand('~/.vim/bundle/coc.nvim'))
  " 設定 安裝插件
  let g:coc_global_extensions = [
    \ 'coc-json', 
    \ 'coc-git', 
    \ 'coc-explorer',
    \ 'coc-go',
    \ 'coc-fzf-preview'
    \ ]
  set updatetime=300
  set shortmess+=c
  set signcolumn=yes


  " Remap keys for gotos
  " 進入下一個定義
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  " Use gh to show documentation in preview window
  nnoremap <silent> gh :call <SID>show_documentation()<CR>
  " 展現coc 文件
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocActionAsync('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')




  " coc-snippets
  " Use <C-l> for trigger snippet expand.
  imap <C-l> <Plug>(coc-snippets-expand)
  " Use <C-j> for select text for visual placeholder of snippet.
  vmap <C-j> <Plug>(coc-snippets-select)
  " Use <C-j> for both expand and jump (make expand higher priority.)
  imap <C-j> <Plug>(coc-snippets-expand-jump)

  "Use tab for trigger completion with characters ahead and navigate.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[d` and `]d` to navigate diagnostics
  " 進入下一個診斷
  nmap <silent> [d <Plug>(coc-diagnostic-prev)
  " 上一個診斷
  nmap <silent> ]d <Plug>(coc-diagnostic-next)

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')
  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call CocAction('fold', <f-args>)


  " fzf 
  nmap <Leader>f [fzf-p]
  xmap <Leader>f [fzf-p]

  nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
  nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
  nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
  nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
  nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
  nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
  nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
  nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
  nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
  nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
  nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
  xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
  nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
  nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
  nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

  "coc explorer
  let g:coc_explorer_global_presets = {
    \   '.vim': {
    \     'root-uri': '~/.config/nvim',
    \   },
    \   'cocConfig': {
    \      'root-uri': '~/.config/coc',
    \   },
    \   'floating': {
    \     'position': 'floating',
    \     'open-action-strategy': 'sourceWindow',
    \     'floating-width': 50,
    \   },
    \   'floatingLeftside': {
    \     'position': 'floating',
    \     'floating-position': 'left-center',
    \     'floating-width': 50,
    \     'open-action-strategy': 'sourceWindow',
    \   },
    \   'floatingRightside': {
    \     'position': 'floating',
    \     'floating-position': 'right-center',
    \     'floating-width': 50,
    \     'open-action-strategy': 'sourceWindow',
    \   },
    \   'bufferFloating': {
    \     'sources': [{'name': 'buffer', 'expand': v:true}],
    \     'position': 'floating',
    \     'floating-width': 50,
    \   },
    \ }
  " coc-explorer 
  nmap <space>e :CocCommand explorer <cr>
  " 啟動浮動視窗的 檔案管理列
  nmap <space>ef :CocCommand explorer --preset floating<CR>
  nmap <space>eb :CocCommand explorer --preset bufferFloating<CR>
  nmap <space>ec :CocCommand explorer --preset cocConfig<CR>
  
endif
