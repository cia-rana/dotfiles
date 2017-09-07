set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/neocomplete.git'
NeoBundle 'fatih/molokai'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'SirVer/ultisnips'

" golang
NeoBundle 'fatih/vim-go'

" syntastic
" you should install 'verilator' for verilog(See: http://dora.bk.tsukuba.ac.jp/~takeuchi/?%E9%9B%BB%E6%B0%97%E5%9B%9E%E8%B7%AF%2FHDL%2FVerilator%20%E3%81%AE%E5%B0%8E%E5%85%A5%EF%BC%88C%2B%2B%E3%83%A2%E3%83%BC%E3%83%89%EF%BC%89)
NeoBundle 'scrooloose/syntastic'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

syntax on

" swp output directory
set directory=~/dotfiles/.vim/tmp

" highlight in search word
set hlsearch

" setting for scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_verilog_verilator_exec = '~/usr/bin/verilator'

" setting for molokai
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
