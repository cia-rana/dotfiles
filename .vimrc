set nocompatible
filetype off

if has('vim_starting')
	set rtp+=~/.vim/plugged/vim-plug
	if !isdirectory(expand('~/.vim/plugged/vim-plug'))
		echo 'install vim-plug...'
		call system('mkdir -p ~/.vim/plugged/vim-plug')
		call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
	end
endif
call plug#begin('~/.vim/plug')

Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}

Plug 'Shougo/neocomplete'
Plug 'Shougo/unite.vim'
Plug 'tomasr/molokai'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'kana/vim-submode'

" golang
Plug 'fatih/vim-go'

" dart
Plug 'cia-rana/dart-vim-plugin'

" syntastic
" you should install 'verilator' for verilog(See: http://dora.bk.tsukuba.ac.jp/~takeuchi/?%E9%9B%BB%E6%B0%97%E5%9B%9E%E8%B7%AF%2FHDL%2FVerilator%20%E3%81%AE%E5%B0%8E%E5%85%A5%EF%BC%88C%2B%2B%E3%83%A2%E3%83%BC%E3%83%89%EF%BC%89)
Plug 'scrooloose/syntastic'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" gist
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'natebosch/vim-lsc'
call plug#end()

filetype plugin indent on

syntax on

set number

set hidden

" change lang to English
if has("multi_lang")
	language C
endif

" swp output directory
set directory=~/dotfiles/.vim/tmp

" highlight in search word
set hlsearch
set incsearch

" setting for scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" eliminate the lag which the mode changes from insert to norml
set ttimeoutlen=50

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set completeopt=menuone
let g:neocomplcache_enable_auto_close_preview = 1

let g:syntastic_verilog_verilator_exec = '~/usr/bin/verilator'

" setting for molokai
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" vim-submode
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme='molokai'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '◀'
let g:airline_symbols.crypt = '🔒'		"暗号化されたファイル
let g:airline_symbols.linenr = '¶'			"行
let g:airline_symbols.maxlinenr = '㏑'		"最大行
let g:airline_symbols.branch = '⭠'		"gitブランチ
let g:airline_symbols.paste = 'ρ'			"ペーストモード
let g:airline_symbols.spell = 'Ꞩ'			"スペルチェック
let g:airline_symbols.notexists = '∄'		"gitで管理されていない場合
let g:airline_symbols.whitespace = 'Ξ'	"空白の警告(余分な空白など)

" nnoremap
nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

" vim-dart-plugin
let dart_format_on_save = 1
let g:loaded_syntastic_dart_dartanalyzer_checker = 0

" lsp
let g:lsp_async_completion = 1

" dart_language_server
if executable('dart_language_server')
	augroup LspDart
		au!
		autocmd User lsp_setup call lsp#register_server({
			\ 'name': 'dart',
			\ 'cmd': {server_info->['dart_language_server']},
			\ 'whitelist': ['dart'],
			\ })
		autocmd FileType dart setlocal omnifunc=lsp#complete
	augroup END
endif
