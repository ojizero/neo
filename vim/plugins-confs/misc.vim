"" General non-specific plugin configs ""
"" """"""""""""""""""""""""""""""""""" ""

"" vim-javascript
""

" JSDocs highlights
let g:javascript_plugin_jsdoc = 1

"" Rust-vim
""

" run rustfmt on save
let g:rustfmt_autosave = 1


"" Syntatic use ESlint
""
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']
