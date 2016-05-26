" Turn off vi compatibility
set nocompatible

" Stop some security exploits - seems this feature is hacked a lot
" https://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html
set modelines=0

" Auto install vim-plug
" https://github.com/junegunn/vim-plug/wiki/faq#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-projectionist'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'digitaltoad/vim-pug'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'
Plug 'Lokaltog/vim-distinguished'
Plug 'mhinz/vim-startify'
call plug#end()

" Plugin configuration
" vim-better-whitespace - remove ws on save
autocmd BufWritePre * StripWhitespace
" vim-gitgutter - make the markers show up quicker
set updatetime=250
" syntastic - defaults from the installation
set t_Co=256
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Theme
syntax enable
set background=dark
colorscheme  distinguished
" ycm
let g:ycm_auto_trigger = 1
" ctrlp use ag
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Sensible defaults from http://stevelosh.com/blog/2010/09/coming-home-to-vim/#making-vim-more-useful
" tabs
set tabstop=2
set softtabstop=0
set noexpandtab
set shiftwidth=2

" Misc
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set mouse=a
if !has('nvim') " neovim doesn't have this
	set ttymouse=xterm2
endif
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set number
set nobackup
set nowritebackup
set directory=/var/tmp//,/tmp//

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Text wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

" Invisible characters
set list
set listchars=tab:→\ ,

" Turn off arrow keys (to help learn keyboard navigation
" Enable later
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk

" turn off the help key for vim
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" make ; also map to :
" nnoremap ; :

" make kj also map to <esc>
inoremap kj <esc>
inoremap jj <esc>
vnoremap kj <esc>
vnoremap jj <esc>

" Save on focus lost (just like webstorm)
au FocusLost * :wa
set autowrite
set autowriteall
augroup AutoWrite
	autocmd! BufLeave * :update
augroup END

" Detect when a file has changed outside of vim and update it
set autoread
autocmd CursorHold * checktime

" automatically change working dir to same as current file
set autochdir
