let g:deoplete#enable_at_startup = 1
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:neomake_open_list = 2
let g:intero_backend = {
        \ 'command': 'intero',
        \ 'options': '-isrc',
        \ 'cwd': expand('% :p:h')
        \ }

