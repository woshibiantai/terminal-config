call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'https://tpope.io/vim/commentary.git'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'https://tpope.io/vim/surround.git'

Plug 'yuttie/comfortable-motion.vim'
Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'mattn/emmet-vim'
call plug#end()

set expandtab tabstop=2 shiftwidth=2 smarttab
set smartcase
set mouse=a
set splitbelow splitright
set foldmethod=indent foldnestmax=10 nofoldenable foldlevel=2

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

" mapping shortcuts
let mapleader = "\,"
inoremap jh <Esc>
noremap <c-c> "*y<CR>

noremap <space> /
noremap <space><CR> :noh<CR>
inoremap <c-v> <esc>"+pa

noremap <C-s> <Esc>:update<CR>
vnoremap <C-s> <Esc>:update<CR>
inoremap <C-s> <Esc>:update<CR>
noremap <C-w> <Esc>:q<CR>
vnoremap <C-w> <Esc>:q<CR>
inoremap <C-w> <Esc>:q<CR>
noremap <C-q> <Esc>:q!<CR>
vnoremap <C-q> <Esc>:q!<CR>
inoremap <C-q> <Esc>:q!<CR>

inoremap <C-h> :wincmd h<CR>
noremap <C-h> :wincmd h<CR>
inoremap <C-j> :wincmd j<CR>
noremap <C-j> :wincmd j<CR>
inoremap <C-k> :wincmd k<CR>
noremap <C-k> :wincmd k<CR>
inoremap <C-l> :wincmd l<CR>
noremap <C-l> :wincmd l<CR>


" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" nerdtree
noremap <leader>nn :NERDTreeToggle<CR>
noremap <leader>nf :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

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

" coc.vim
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
