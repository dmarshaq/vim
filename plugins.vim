let s:plugin_dir = expand("~/.config/vim/plugged")

function! s:ensure(repo)
    let name = split(a:repo, '/')[-1]
    let path = s:plugin_dir . '/' . name

    if !isdirectory(path)
        if !isdirectory(plugin_dir)
            call mkdir(s:plugin_dir, 'p')
        endif
        execute "!git clone --depth=1 https://github.com/" . a:repo . ' ' . shellescape(path)
    endif

    execute "set runtimepath+=" . fnameescape(path)
endfunction

call s:ensure("m6vrm/gruber.vim")
call s:ensure("junegunn/fzf")
call s:ensure("junegunn/fzf.vim")
call s:ensure("itchyny/lightline.vim")
call s:ensure("yegappan/lsp")
call s:ensure("iamcco/markdown-preview.nvim")

