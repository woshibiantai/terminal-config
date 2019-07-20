call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/tpope/vim-fugitive.git'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'https://tpope.io/vim/commentary.git'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'

Plug 'yuttie/comfortable-motion.vim'
Plug 'morhetz/gruvbox'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'https://github.com/Shougo/neco-syntax.git'
Plug 'https://github.com/leafgarland/typescript-vim.git'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

set expandtab tabstop=4 shiftwidth=4 smarttab
set smartcase
colorscheme gruvbox

" mapping shortcuts
let mapleader = "\,"
inoremap jh <Esc>

noremap <space> /
noremap <space><CR> :noh<CR>

noremap <c-s> <Esc>:update<CR>
vnoremap <c-s> <Esc>:update<CR>
inoremap <c-s> <Esc>:update<CR>

noremap <c-w> <Esc>:q<CR>
vnoremap <c-w> <Esc>:q<CR>
inoremap <c-w> <Esc>:q<CR>

noremap <c-q> <Esc>:q!<CR>
vnoremap <c-q> <Esc>:q!<CR>
inoremap <c-q> <Esc>:q!<CR>

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" nerdtree
noremap <leader>nn :NERDTreeToggle<CR>
noremap <leader>nf :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:deoplete#enable_at_startup = 1

" vim-smooth-scroll 
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

noremap <leader>p :Files<cr>
noremap <leader>f :BLines<cr>
noremap <leader>b :Buffers<cr>
noremap <leader><S-f> :Rg<cr>
noremap <leader><S-p> :Commands<cr>

" typescript-vim
let g:typescript_indent_disable = 1

" vim-airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

