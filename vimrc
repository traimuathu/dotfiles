set encoding=utf-8

call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'morhetz/gruvbox'
"Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'


call plug#end()

set noerrorbells
set backspace=2   
set nobackup
set nowritebackup
set noswapfile    
set history=50
set ruler        
set showcmd       
set incsearch     
set laststatus=2  
set autowrite     
set modelines=0   
set nomodeline
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set nu
inoremap <F3> <esc> :wq<CR>
set laststatus=2
let g:gruvbox_italic=1

colorscheme gruvbox
set termguicolors
set background=dark

let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}
function IsMe() 
  return "Traimuathu "
endfunction
  
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

let gitBranch=system("git rev-parse --abbrev-ref HEAD")

set statusline=
"set statusline+=%{MyStatus())}
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=\ %{GitBranch()}
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%{IsMe()}
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
execute "set statusline +=" . gitBranch

set cursorline
set showtabline=2

let mapleader = ","
let g:mapleader = ","
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>w :wq<CR>


let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10		
let g:ctrlp_switch_buffer = 'et'	
let g:ctrlp_mruf_max=450 		
let g:ctrlp_max_files=0  		
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'


set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

