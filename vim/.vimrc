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
Plug 'tomtom/tcomment_vim'
Plug 'https://tpope.io/vim/surround.git'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Visual
Plug 'franbach/miramare'
Plug 'arcticicestudio/nord-vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'ryanoasis/vim-devicons'

" Completion
Plug 'burnettk/vim-angular'
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'posva/vim-vue'
Plug 'evanleck/vim-svelte'
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dhruvasagar/vim-table-mode'
call plug#end()

" formatting preferences
set encoding=UTF-8
set ignorecase
set smartcase
set smartindent
set expandtab tabstop=2 shiftwidth=2 smarttab
set foldmethod=indent foldnestmax=10 nofoldenable foldlevel=2

" interface preferences
set mouse=a
set autoread
set splitbelow splitright
set cmdheight=2
set hlsearch
autocmd InsertEnter,InsertLeave * set cul!

" mapping shortcuts
let mapleader = "\,"
inoremap jj <Esc>
nnoremap <Leader><Leader>v :tabnew ~/terminal-config/vim/.vimrc <CR>
nnoremap <Leader><Leader>r :source ~/.vimrc <CR>

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
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

" tab navigation
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>r :tabp<CR>
nnoremap <leader>y :tabn<CR>

" GUI settings
set guifont=MesloLGS_Nerd_Font:h12
set guioptions-=L
set guioptions+=e
let g:miramare_transparent_background=1
colorscheme miramare
:hi Search ctermfg=Black ctermbg=DarkYellow
:hi TabLineFill ctermfg=Black ctermbg=Black
:hi TabLine ctermfg=White ctermbg=DarkGray
:hi TabLineSel ctermfg=Black ctermbg=Green

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" enable matchit
runtime macros/matchit.vim

" netrw
let g:netrw_liststyle=3
let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
autocmd FileType netrw setl bufhidden=delete

" fzf.vim
noremap <leader>p :GFiles<cr>
noremap <leader>f :BLines<cr>
noremap <leader>b :Buffers<cr>
noremap <leader><S-p> :Commands<cr>
noremap <leader>e :Rg<CR>
noremap <leader>m :Marks<cr>

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
let g:airline_theme='miramare'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" comfortable-motion
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 0.7  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>

" for use with vue
let g:vue_pre_processors=[]

" Git
nmap <space>gb :G blame<CR>
nmap <space>gd :Gvdiff
nmap <space>gv <Plug>(GitGutterPreviewHunk)
nmap <space>go :Gvsplit
nmap <space>dp :diffput
nmap <space>dg :diffget

" Fugitive Conflict Resolution
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" coc
let g:coc_global_extensions = [
  \ 'coc-actions',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-vimlsp',
  \ 'coc-highlight',
  \ 'coc-ember',
\]
nmap gd <Plug>(coc-definition)

"svelte
let g:svelte_indent_script = 0
let g:svelte_indent_style = 0

"angular
let g:angular_find_ignore = ['build/', 'node_modules/']


"coc-css
autocmd FileType scss setl iskeyword+=@-@

"coc-snippets
inoremap <C-l> <Plug>(coc-snippets-expand)
