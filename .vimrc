execute pathogen#infect()
autocmd vimenter * NERDTree

" ward off unexpected things
set nocompatible

" syntax highlighting
syntax on

" tab spacing to 4 spaces
" set tabstop=4
set tabstop=2
" set shiftwidth=4
set shiftwidth=2
set expandtab

" line numbers
set number

" use mouse
set mouse=a

" highlight search
set hlsearch

" case insensitive search
set ignorecase
set smartcase

" yank to clipboard
set clipboard=unnamedplus

" Git specific configuration
let git_path = system("git rev-parse --show-toplevel 2>/dev/null")
let git_vimrc = substitute(git_path, '\n', '', '') . "/.vimrc"
if !empty(glob(git_vimrc))
    sandbox exec ":source " . git_vimrc
endif

:command Test !bin/rails test
:command SystemTest !bin/rake test:system

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

