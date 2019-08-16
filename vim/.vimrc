call plug#begin('~/.config/nvim/plugged')
" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'justinmk/vim-sneak'

" Git
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Formatting
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'https://tpope.io/vim/commentary.git'
Plug 'https://tpope.io/vim/surround.git'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'

" Visual
Plug 'ayu-theme/ayu-vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Completion
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()

set expandtab tabstop=2 shiftwidth=2 smarttab
set ignorecase
set smartcase
set smartindent
set mouse=a
set splitbelow splitright
set foldmethod=indent foldnestmax=10 nofoldenable foldlevel=2

set cursorline
set cmdheight=2

" mapping shortcuts
let mapleader = "\,"
inoremap jh <Esc>
noremap <c-c> "*y<CR>
inoremap <c-v> <esc>"+pa
noremap <space><CR> :noh<CR>

inoremap <C-h> <C-o>:wincmd h<CR>
noremap <C-h> :wincmd h<CR>
inoremap <C-j> <C-o>:wincmd j<CR>
noremap <C-j> :wincmd j<CR>
inoremap <C-k> <C-o>:wincmd k<CR>
noremap <C-k> :wincmd k<CR>
inoremap <C-l> <C-o>:wincmd l<CR>
noremap <C-l> :wincmd l<CR>

" Switch tab with Cmd + [1-9].
nnoremap <d-1> :tabn 1<CR>
nnoremap <d-2> :tabn 2<CR>
nnoremap <d-3> :tabn 3<CR>
nnoremap <d-4> :tabn 4<CR>
nnoremap <d-5> :tabn 5<CR>
nnoremap <d-6> :tabn 6<CR>
nnoremap <d-7> :tabn 7<CR>
nnoremap <d-8> :tabn 8<CR>
nnoremap <d-9> :tabn 9<CR>
nnoremap <d-9> :tabn 0<CR>
inoremap <d-1> <C-o>:tabn 1<CR>
inoremap <d-2> <C-o>:tabn 2<CR>
inoremap <d-3> <C-o>:tabn 3<CR>
inoremap <d-4> <C-o>:tabn 4<CR>
inoremap <d-5> <C-o>:tabn 5<CR>
inoremap <d-6> <C-o>:tabn 6<CR>
inoremap <d-7> <C-o>:tabn 7<CR>
inoremap <d-8> <C-o>:tabn 8<CR>
inoremap <d-9> <C-o>:tabn 9<CR>
inoremap <d-9> <C-o>:tabn 0<CR>

" GUI settings
set guifont=Menlo:h14
set guioptions-=L
set guioptions+=e

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" ale
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

" nerdtree
noremap <leader>nn :NERDTreeToggle<CR>
noremap <leader>nf :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" fzf.vim
noremap <leader>p :Files<cr>
noremap <leader>f :BLines<cr>
noremap <leader>b :Buffers<cr>
noremap <leader><S-f> :Rg<cr>
noremap <leader><S-p> :Commands<cr>

" typescript-vim
let g:typescript_indent_disable = 1

" vim-airline
let g:airline_theme='minimalist'

" coc.vim
set hidden
set updatetime=300

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "•",
  \ "Staged"    : "+",
  \ "Untracked" : "*",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "x",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ }

" ayu-vim colorscheme
set termguicolors
let ayucolor="mirage"
colorscheme ayu

" comfortable-motion
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>

" for use with svelte
au BufNewFile,BufRead,BufReadPost *.svelte set syntax=html
