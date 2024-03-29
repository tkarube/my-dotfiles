"set number
set shell=/bin/zsh
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
"set smartindent
"set autochdir
set hlsearch
set clipboard=unnamed
syntax on

set completeopt=menuone,noinsert

""" Vim-Plug
call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()

""" NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

""" vim-gitgutter
let g:gitgutter_highlight_lines = 1
