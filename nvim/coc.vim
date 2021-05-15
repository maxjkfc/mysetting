if isdirectory(expand('~/.vim/bundle/coc.nvim'))
  " 設定 安裝插件
  let g:coc_global_extensions = [
    \ 'coc-json', 
    \ 'coc-git', 
    \ 'coc-explorer',
    \ 'coc-go',
    \ 'coc-fzf-preview',
    \ 'coc-diagnostic', 
    \ 'coc-snippets',
    \ 'coc-yaml',
    \ 'coc-spell-checker',
    \ ]

  " 設定更新時間
  set updatetime=300
  set shortmess+=c
  set signcolumn=yes

  " coc-spell-checker
  vmap <leader>a <Plug>(coc-codeaction-selected)
  xmap <leader>a <Plug>(coc-codeaction-selected)

  " Remap keys for go to
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
  " 在輸入模式 使用 <C-l> 觸發擴展
  imap <C-l> <Plug>(coc-snippets-expand)
  " 使用 <C-j> 來選擇要輸入的參數
  vmap <C-j> <Plug>(coc-snippets-select)
  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-j>'
  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'

  " Use <C-j> for both expand and jump (make expand higher priority.)
  imap <C-j> <Plug>(coc-snippets-expand-jump)

  " 使用 <tab> 觸發 輸入參數
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " 使用 enter 觸發提交提示列表
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " 重新命名此單字在本檔案內該的所有相同單字 Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')
  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call CocAction('fold', <f-args>)
  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " fzf 
  " 列出有哪些錯誤
  nnoremap <silent> <space>a     :<C-u>CocCommand fzf-preview.CocDiagnostics <CR>
  " 列出目前檔案有哪些錯誤
  nnoremap <silent> <space>aa    :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics <CR>
  " 找尋檔案
  nnoremap <silent> <space>p     :<C-u>CocCommand fzf-preview.FromResources directory project project_mru git<CR>
  nnoremap <silent> <space>f     :<C-u>CocCommand fzf-preview.ProjectFiles <CR>
  " 查詢此 Git 狀態
  nnoremap <silent> <space>gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
  " 調用 Git 命令列
  nnoremap <silent> <space>ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
  " 調用 Git Log
  nnoremap <silent> <space>gl    :<C-u>CocCommand fzf-preview.GitLogs<CR>
  " 取得 目前 Buffers 清單
  nnoremap <silent> <space>b     :<C-u>CocCommand fzf-preview.Buffers<CR>
  " 取得 目前所有 Buffers 
  nnoremap <silent> <space>B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
  " 跳轉列表
  nnoremap <silent> <space><C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
  " 查看最近修改內容
  nnoremap <silent> <space>g;    :<C-u>CocCommand fzf-preview.Changes<CR>
  " 搜尋此檔案
  nnoremap <silent> <space>/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
  " 搜尋此單字 在此檔案
  nnoremap <silent> <space>*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
  " 搜尋所有檔案
  nnoremap          <space>gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
  xnoremap          <space>gr    "sy:FzfPreviewProjectGrepRpc<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
  " 查詢 PullRequest
  nnoremap <silent> <space>pr    :<C-u>CocCommand fzf-preview.BlamePR<CR>
  " 查詢實做
  nnoremap <silent> <space>i    :<C-u>CocCommand fzf-preview.CocImplementations<CR>

  let g:fzf_preview_floating_window_rate = 0.8
  let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"' " Installed ripgrep
  let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g \!".git"'
  let g:fzf_preview_command = 'bat --color=always --plain {-1}' " Installed bat


  " coc-multiple 
  " 將當前游標位置加入選擇範圍內
  " nmap <silent> <C-c> <Plug>(coc-cursors-position)

  "coc explorer
  let g:coc_explorer_global_presets = {
    \   'cocConfig': {
    \      'root-uri': '~/.config/coc',
    \   },
    \   'floating': {
    \     'position': 'floating',
    \     'open-action-strategy': 'sourceWindow',
    \     'floating-width': 50,
    \   },
    \ }

  " coc-explorer 
  nmap <space>e :CocCommand explorer <cr>
  " 啟動浮動視窗的 檔案管理列
  nmap <space>ef :CocCommand explorer --preset floating<CR>
  nmap <space>ec :CocCommand explorer --preset cocConfig<CR>

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
  
endif
