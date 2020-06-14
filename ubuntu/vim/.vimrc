set number
syntax on
"set softtabstop=2
"set tabstop=2
set expandtab
set backspace=2
set incsearch
set hlsearch
set autowrite
set nobackup
set noswapfile
" code fold by indent
set fdm=indent
set pastetoggle=<F9>

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

" Use space to close and open code fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'fatih/vim-go'
" Plugin 'Valloric/YouCompleteMe' 
" Plugin 'vim-syntastic/syntastic'
" Plugin 'rjohnsondev/vim-compiler-go'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
" Plugin 'Shougo/neocomplete.vim'

call vundle#end()
filetype plugin indent on
filetype plugin on

" nerdtree conf
let NERDTreeShowHidden=1
silent! autocmd VimEnter * NERDTree
autocmd StdinReadPre * let s:std_in=1
silent! autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
silent! autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <F7> :NERDTree<CR>

" molokai
syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
silent! colorscheme molokai

" vim-go
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"autocmd BufWritePost,FileWritePost *.go execute 'GoMetaLinter'
"autocmd BufNewFile,BufRead *.go setlocal noet ts=2 sw=2 sts=2
"autocmd BufWritePost,FileWritePost *.go execute 'GoVet'

" tagbar
silent! autocmd VimEnter * TagbarToggle
nmap <F8> :TagbarToggle<CR>

" neocomplete
" let g:neocomplete#enable_at_startup = 1
