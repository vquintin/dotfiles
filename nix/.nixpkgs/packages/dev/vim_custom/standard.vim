" CTRL-P
set grepprg=rg\ --vimgrep
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

let g:ctrlp_user_command = 'rg --files %s'
let g:ctrlp_use_caching = 0

" Error and warning signs.

let g:ale_linters = {
\   'haskell': [],
\}

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" LSP

nnoremap <silent> <leader>K :LspHover<CR>
nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> <F2> :LspRename<CR>

if executable('hie')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'hie',
      \ 'cmd': {server_info->['hie-8.2', '--ekg', '--lsp']},
      \ 'whitelist': ['haskell'],
      \ })
endif

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" let g:go_fmt_command = "goimports"

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)


let g:elm_format_autosave = 1

" Configure haskell extensions
autocmd FileType haskell nmap <silent> <leader>e :GhcModTypeInsert<CR>
autocmd FileType haskell nmap <silent> <leader>s :GhcModSplitFunCase<CR>
autocmd FileType haskell nmap <silent> <leader>i :GhcModType<CR>
autocmd FileType haskell nmap <silent> <leader>c :GhcModTypeClear<CR>
autocmd FileType haskell nmap <silent> <leader>g :GhcModSigCodegen<CR>

" Scala
autocmd FileType scala nmap <silent> <leader>h :EnType<CR>
autocmd BufWritePost *.scala silent :EnTypeCheck
