" reload config
" \s
map <leader>s :source $MYVIMRC<CR>

" reopen previously closed file
" \\
nnoremap <Leader><Leader> :e#<CR>


"" fzf - Fuzzy finder
""

noremap <C-p> :FZF<CR>
noremap <C-f> :FZF!<CR>
