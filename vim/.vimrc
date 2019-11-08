call plug#begin('~/.config/nvim/plugged')
" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'https://github.com/tpope/vim-vinegar.git'
Plug 'justinmk/vim-sneak'
Plug 'https://github.com/vim-scripts/BufOnly.vim.git'

" Git
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'

" Formatting
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'https://tpope.io/vim/commentary.git'
Plug 'https://tpope.io/vim/surround.git'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'

" Visual
Plug 'morhetz/gruvbox'
Plug 'yuttie/comfortable-motion.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'ryanoasis/vim-devicons'

" Completion
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'posva/vim-vue'
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()

set expandtab tabstop=2 shiftwidth=2 smarttab
set ignorecase
set smartcase
set smartindent

set mouse=a
set autoread
set splitbelow splitright
set foldmethod=indent foldnestmax=10 nofoldenable foldlevel=2

set cursorline
set cmdheight=2
set hlsearch
set encoding=UTF-8

" mapping shortcuts
let mapleader = "\,"
inoremap jh <Esc>

" remove highlight
nnoremap <space><CR> :noh<CR> 

" search and replace
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
nnoremap <Leader>F :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" copy paste
noremap <Leader>c "*y
noremap <Leader>v "*p
noremap <Leader>C "+y
noremap <Leader>V "+p

" window management
nnoremap <leader>d :bd<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>w :q<CR>
nnoremap <leader>q :q!<CR>

" pane navigation
inoremap <C-h> <C-o>:wincmd h<CR>
nnoremap <C-h> :wincmd h<CR>
inoremap <C-j> <C-o>:wincmd j<CR>
nnoremap <C-j> :wincmd j<CR>
inoremap <C-k> <C-o>:wincmd k<CR>
nnoremap <C-k> :wincmd k<CR>
inoremap <C-l> <C-o>:wincmd l<CR>
nnoremap <C-l> :wincmd l<CR>

" Switch tab with Cmd + [1-9].
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>1 :tabn 1<CR>
nnoremap <leader>2 :tabn 2<CR>
nnoremap <leader>3 :tabn 3<CR>
nnoremap <leader>4 :tabn 4<CR>
nnoremap <leader>5 :tabn 5<CR>

" GUI settings
set guifont=MesloLGS_Nerd_Font:h12
set guioptions-=L
set guioptions+=e

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" enable matchit
runtime macros/matchit.vim

" ale
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

" netrw
let g:netrw_liststyle=3
let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

" fzf.vim
noremap <leader>p :Files<cr>
noremap <leader>f :BLines<cr>
noremap <leader>b :Buffers<cr>
noremap <leader><S-p> :Commands<cr>
noremap <leader>e :Rg<CR>

" for fzf Rg to search with preview
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" ctrlsf.vim
nmap <leader>gg <Plug>CtrlSFPrompt
vmap <leader>gg <Plug>CtrlSFVwordPath
nnoremap <leader>gf :CtrlSFToggle<cr>
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_position = 'left'
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_auto_focus = { 'at': 'start' }

" typescript-vim
let g:typescript_indent_disable = 1

" vim-airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" coc.vim
set hidden
set updatetime=300
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rr <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-format-selected)
vmap <leader>rf <Plug>(coc-format-selected)

" gruvbox
set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

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

" for use with vue
let g:vue_pre_processors=[]

" Git
nmap <space>ga :Git add -p<CR>
nmap <space>gb :Gblame<CR>
nmap <space>gc :Gcommit<CR>
nmap <space>gca :Gcommit --amend<CR>
nmap <space>gd :Gdiff
nmap <space>gp :Gpush<CR>
nmap <space>gs :Gstatus<CR>
nmap <space>gv <Plug>GitGutterPreviewHunk
nmap <space>gw :Gwrite<CR>
nmap <space>go :Gvsplit
