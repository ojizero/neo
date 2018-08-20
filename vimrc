let s:path = expand('<sfile>:p:h')

"" Misc
""
filetype on
syntax on
" colorscheme THEME
set guifont=Operator\ Mono:h14
" set colorcolumn=90
set number
set showmatch

"" Indents
""
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
" enable mouse interractions
set mouse=a

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

"" Source other non-init.vim files this
"" currently includes plugins.vim only
""
let s:confs = split(globpath(s:path, 'plugins-configs/*.vim'), '\n')

for conf in s:confs
  if conf !~ '.*init\.vim$'
    execute 'source '.conf
  endif
endfor
