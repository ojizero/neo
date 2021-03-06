let s:path = expand('<sfile>:p:h')

"" Misc
""

" when only one window is left don't close,
" just open an empty buffer this has
" no effect on :qa, only on :q
autocmd QuitPre * if winnr('$') == 1 && tabpagenr('$') == 1 && @% != '' | new | endif

" highlight shebangs as comments (mainly for
" languages that don't use # for comments)
augroup shebangs
  autocmd!
  autocmd BufEnter * syntax match ShebangPattern /^#!\s\?\([\/\\][^\0\/\\]*[^\/\\]\)*$/
augroup END
highlight link ShebangPattern Comment

filetype on
syntax on
" colorscheme THEME
set guifont=Operator\ Mono:h14

" set highlight indicating long lines
set colorcolumn=91
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

set number
set showmatch

set splitbelow
set splitright

" use system clipboard
set clipboard=unnamedplus

" enable mouse interractions
set mouse=a

" write new files when made
autocmd BufNewFile * :write

" case insenstive everything
set ignorecase
set wildignorecase

"" Indents
""
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

"" On save
""
" remove redundant whitespaces
autocmd BufWritePre * :%s/\s\+$//e

"" Maps
""
execute 'source '.s:path.'/maps.vim'

"" Plugins
""
execute 'source '.s:path.'/plugins.vim'

" source custom configurations for plugins
let s:confs = split(globpath(s:path, 'plugins-configs/*.vim'), '\n')

for conf in s:confs
  execute 'source '.conf
endfor
