call pathogen#infect()
call pathogen#helptags()

"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------

set encoding=utf-8
set tenc=utf8
set fileencodings=utf-8,chinese,latin-1
set fileencoding=utf-8

" General Settings

set nocompatible    " not compatible with the old-fashion vi mode
set bs=2            " allow backspacing over everything in insert mode
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set autoread        " auto read when file is changed from outside
set nu              " display line number
set ts=4            " tabstop 4
set wak=no          " disable GUI alt menu
set noswapfile
set list listchars=tab:»·,trail:·

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" TagBar
nmap <F8> :TagbarToggle<CR>

" Go-vim setting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
let g:molokai_original = 1
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap gd <Plug>(go-def)

autocmd! bufwritepost .vimrc source ~/.vimrc

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" TAB setting{
set expandtab        "replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4

au FileType Makefile set noexpandtab
"}

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}
