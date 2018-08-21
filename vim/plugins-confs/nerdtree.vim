let NERDTreeIgnore = [
      \'node_modules',
      \'dist',
      \'vendor',
      \]

" open nerdtree on vim start
autocmd vimenter * NERDTree

" persist nerd tree state
" autocmd bufenter * NERDTreeMirror " this is standard nerdtree cmd
autocmd bufenter * NERDTreeMirrorOpen

" " open nerdtree on vim start to a specific folder
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close if only nerdtree buffer is left
" TODO: alter this maybe to keep one buffer open ?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
