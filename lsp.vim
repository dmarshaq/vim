" Enable diagnostics highlighting
let lspOpts = #{autoHighlightDiags: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)

let lspServers = []

if executable('clangd')
    call add(lspServers, #{
                \ name: 'clangd',
                \ filetype: ['c', 'cpp'],
                \ path: 'clangd',
                \ args: []
                \ })
endif

if executable('typescript-language-server')
    call add(lspServers, #{
                \ name: 'typescriptlang',
                \ filetype: ['javascript', 'typescript'],
                \ path: 'typescript-language-server',
                \ args: []
                \ })
endif

if executable('jdtls')
    call add(lspServers, #{
                \ name: 'jdtls',
                \ filetype: ['java'],
                \ path: 'jdtls',
                \ args: []
                \ })
endif

autocmd User LspSetup call LspAddServer(lspServers)

" Key mappings
nnoremap gd :LspGotoDefinition<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap K  :LspHover<CR>
nnoremap ld :LspDiag current<CR>
nnoremap ca :LspCodeAction<CR>
nnoremap <leader>nd :LspDiag next \| LspDiag current<CR>
nnoremap <leader>pd :LspDiag prev \| LspDiag current<CR>
inoremap <silent> <C-Space> <C-x><C-o>

" Set omnifunc for completion
autocmd FileType php setlocal omnifunc=lsp#complete

" Custom diagnostic sign characters
autocmd User LspSetup call LspOptionsSet(#{
    \   diagSignErrorText: '✘',
    \   diagSignWarningText: '▲',
    \   diagSignInfoText: '»',
    \   diagSignHintText: '⚑',
    \ })





