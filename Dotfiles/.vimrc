"Vundle Plugin Manager Start
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" ******* PLUGINS BEGIN *********

"You Complete Me
Plugin 'ycm-core/YouCompleteMe'

"NERD TREE INSTALL
Plugin 'scrooloose/nerdtree'

"FZF
Plugin 'junegunn/fzf.vim'

"Gruvbox 
Plugin 'morhetz/gruvbox'

"Airline
Plugin 'vim-airline/vim-airline'

"Indent matching
Plugin 'nathanaelkane/vim-indent-guides'

"Fugitive - GIt Wrapper
Plugin 'tpope/vim-fugitive'


" ***** Plugins END **********

call vundle#end()                   " required
filetype plugin indent on           " required

" Vim UI
set background=dark
set termguicolors                   " Use True Colors
colorscheme gruvbox
syntax on

" Editor Settings
set number                          " show line numbers
set backspace=indent,eol,start      " Enable backspace to work like other programs:
set confirm                         " Prompt user to save unsaved changes when quitting
set mouse=a                         " Allows for mouse scrolling
set scrolloff=5
set smartindent     		        " indent when
set tabstop=4       		        " tab width
set softtabstop=4   		        " backspace
set shiftwidth=4                    " indent width
set expandtab                       " expand tab to space
set cindent

" Nerdtree Hotkey, notice toggle
map <silent> <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree

" <S-s> and <S-r> stop and resume ycm autocompletion(disabled by default)
nmap <S-s> :let g:ycm_auto_trigger=0<CR>
nmap <S-r> :let g:ycm_auto_trigger=1<CR>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1

" Copying and Pasting to System Clipboard
vmap <C-C> :!xclip -f -sel clip<CR>
map <C-V> :-1r !xclip -o -sel clip<CR>
imap <C-V> <C-O>:-1r !xclip -o -sel clip<CR>

"Bracket Matching
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
