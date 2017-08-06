set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/unite.vim.git'

" golang
NeoBundle 'fatih/vim-go'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
