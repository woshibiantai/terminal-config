call plug#begin('~/.config/nvim/plugged')
" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'justinmk/vim-sneak'

" Git
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Formatting
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'https://tpope.io/vim/commentary.git'
Plug 'https://tpope.io/vim/surround.git'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'

" Visual
Plug 'https://github.com/danilo-augusto/vim-afterglow.git'
Plug 'https://github.com/danilo-augusto/vim-afterglow.git'
Plug 'ayu-theme/ayu-vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

" mapping shortcuts
let mapleader = "\,"
inoremap jh <Esc>
nnoremap <c-c> "*y<CR>
inoremap <c-v> <esc>"+pa
nnoremap <space><CR> :noh<CR>

nnoremap <leader>d :bd<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>w :q<CR>
nnoremap <leader>q :q!<CR>

inoremap <C-h> <C-o>:wincmd h<CR>
nnoremap <C-h> :wincmd h<CR>
inoremap <C-j> <C-o>:wincmd j<CR>
nnoremap <C-j> :wincmd j<CR>
inoremap <C-k> <C-o>:wincmd k<CR>
nnoremap <C-k> :wincmd k<CR>
inoremap <C-l> <C-o>:wincmd l<CR>
nnoremap <C-l> :wincmd l<CR>

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
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeAutoDeleteBuffer=1
autocmd FileType nerdtree setlocal relativenumber

" fzf.vim
noremap <leader>p :Files<cr>
noremap <leader>f :BLines<cr>
noremap <leader>b :Buffers<cr>
noremap <leader><S-p> :Commands<cr>

" ctrlsf.vim
nmap <leader>g <Plug>CtrlSFPrompt
vmap <leader>g <Plug>CtrlSFVwordPath
nnoremap <leader>gf :CtrlSFToggle<cr>
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_position = 'left'
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_auto_focus = { 'at': 'start' }

" typescript-vim
let g:typescript_indent_disable = 1

" vim-airline
" let g:airline_theme='minimalist'
let g:airline_theme='afterglow'

" coc.vim
set hidden
set updatetime=300
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nnoremap gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>rr <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-format-selected)
vmap <leader>rf <Plug>(coc-format-selected)

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
" let ayucolor="mirage"
" colorscheme ayu
colorscheme afterglow
let g:afterglow_blackout=1

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

" gitgutter
nmap <leader>ha <Plug>GitGutterStageHunk
nmap <leader>hd <Plug>GitGutterUndoHunk
nmap <leader>hv <Plug>GitGutterPreviewHunk
