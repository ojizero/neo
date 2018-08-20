let xdg_data_home = $XDG_DATA_HOME
if xdg_data_home == ''
  let xdg_data_home = '~/.local/share'
endif

let plugins_home = xdg_data_home.'/nvim/plugins'

call plug#begin(plugins_home)

"" Define plugins to use here
""

" Side bar file explorer
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

call plug#end()
