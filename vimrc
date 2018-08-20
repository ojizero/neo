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

"" Maps
""
map <leader>s :source ~/.vimrc<CR>

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

" reopen previously closed file
nnoremap <Leader><Leader> :e#<CR>

"" Source other non-init.vim files this
"" currently includes plugins.vim only
""
let s:confs = split(globpath(s:path, '*.vim'), '\n')

for conf in s:confs
  if conf !~ '.*init\.vim$'
    execute 'source '.conf
  endif
endfor
