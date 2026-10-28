" vimtex mappings use <localleader>, make it match <leader> so <leader>ll compiles.
let maplocalleader = " "

" Single-shot compile on <leader>ll instead of latexmk's continuous watch mode.
" Build files (.aux, .log, ...) go to .build/, only the pdf stays next to the .tex.
let g:vimtex_compiler_latexmk = #{continuous: 0, aux_dir: '.build'}

" Zathura auto-reloads the pdf when it changes on disk.
let g:vimtex_view_method = 'zathura'

" Formatting through texlab (uses latexindent).
autocmd FileType tex nnoremap <buffer> <leader>lf :LspFormat<CR>

" Only pop up the error list on real errors, not warnings (<leader>le still shows them).
let g:vimtex_quickfix_open_on_warning = 0

" Keep the quickfix window small.
autocmd FileType qf resize 5
