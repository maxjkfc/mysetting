" Golang
if isdirectory(expand('~/.vim/bundle/vim-go'))
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_interfaces = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_generate_tags = 1

    " 由於是使用 coc-go 來觸發 gopls 因此關閉 vim-go 的觸發
    let g:go_def_mapping_enabled = 0 
    let g:go_doc_keywordprg_enabled = 0
    let g:go_gopls_enabled = 0
    let g:go_gopls_options = ['-remote=auto']
    let g:go_fmt_autosave = 0

    augroup golangcmd
        au FileType go nmap <Leader>en <Plug>(go-rename)
        au FileType go nmap <leader>r <Plug>(go-run)
        au FileType go nmap <leader>b <Plug>(go-build)
        au FileType go nmap <leader>t <Plug>(go-test)
        au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
        au FileType go nmap <leader>co <Plug>(go-coverage)
        " from coc-go
        au FileType go nmap gtj :CocCommand go.tags.add json<cr> 
        au FileType go nmap gty :CocCommand go.tags.add yaml<cr>
        au FileType go nmap gtb :CocCommand go.tags.add bson<cr>
        au FileType go nmap gtx :CocCommand go.tags.clear<cr>
        au BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
    augroup END
endif
