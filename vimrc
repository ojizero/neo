"" section-name
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


"" Enable plugins
""
" source the plugins file
