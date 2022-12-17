"
" call the ~/.vim/vimplug
source ~/.vim/vimplug
"
"
set number 										" show line numbers
set laststatus=2 								" status bar
set nocompatible								" set compatibility to vim only
set nowrap 										" nowrap the text that extends beyond the screen
set relativenumber							" show line number from current line to upwards and downwards 
set nu											" show current line number
set encoding=utf-8 							" encoding			
set tabstop=3 softtabstop=3 				" set tab to 4 spaces
set shiftwidth=3
set expandtab
set smartindent
set incsearch									" highlight as you search
set scrolloff=9								" start scrolling when you 9 lines away
set clipboard=unnamedplus              " remaps default copy paste to system clipboard
set cursorline                         " highligth line where cursor is 
set completeopt=menu,menuone,noselect  " select high mached option
"
highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
"
filetype plugin indent on              " indent for diiferent languages
syntax on										" syntax highlighting 
colorscheme gruvbox                    " set colortheme
set background=dark                    " bg dark
hi Normal guibg=NONE ctermbg=NONE      " bg transperant
"
" Vim Shortcut Key Maping
let mapleader = " "                    " map leader key to space
" 
" when popup menu is visible select highlited option
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
" plugins Shortcuts
map <Leader>f :NERDTreeToggle<CR>      " toggle nerdtree
"
" persistent_undo
set undodir=~/.vim/undodir"
set undofile
let g:undotree_WindowLayout = 2
"
" vim wiki
set nocompatible
filetype plugin on
syntax on
"
" return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"
