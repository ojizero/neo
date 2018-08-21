XDG_CONFIG_HOME ?= ~/.config
XDG_DATA_HOME ?= ~/.local/share

CONF_PATH := $(XDG_CONFIG_HOME)/nvim
DATA_PATH := $(XDG_DATA_HOME)/nvim

AUTO_PATH := $(CONF_PATH)/autoload
VIMRC_PATH := $(CONF_PATH)/init.vim
MAPS_PATH := $(CONF_PATH)/maps.vim
PLUGINS_VIM_PATH := $(CONF_PATH)/plugins.vim
PLUGINS_CONFIGS_PATH := $(CONF_PATH)/plugins-configs
COLORS_PATH := $(CONF_PATH)/colors
PLUGINS_DATA_PATH := $(DATA_PATH)/plugins

# backup old stuff
# symlink current conf
# {{~/.config}}/nvim/init.vim
setup: backup mk-dirs mk-symlinks vim-installs

# Update conf
update:
	@\git pull ;

# Undo setup
remove: rm-symlinks rm-dirs

backup:
# If wildcard is not
# nothing it exists
ifneq (,$(wildcard $(CONF_PATH)))
	@\cp -Rv $(CONF_PATH) $(addsuffix .bck,$(CONF_PATH)) ;
endif

mk-dirs:
	@\mkdir -pv $(CONF_PATH) ;
	@\mkdir -pv $(DATA_PATH) ;
	@\mkdir -pv $(PLUGINS_DATA_PATH) ;

mk-symlinks:
	@\ln -sv $(abspath ./vimrc) $(VIMRC_PATH) ;

	@\ln -sv $(abspath ./vim/autoload) $(AUTO_PATH) ;
	@\ln -sv $(abspath ./vim/maps.vim) $(MAPS_PATH) ;
	@\ln -sv $(abspath ./vim/colors) $(COLORS_PATH) ;

	@\ln -sv $(abspath ./vim/plugins.vim) $(PLUGINS_VIM_PATH) ;
	@\ln -sv $(abspath ./vim/plugins-confs) $(PLUGINS_CONFIGS_PATH) ;

vim-installs: vim-PlugInstall
	@\pip3 install --user --upgrade neovim ;

# This may fails on C#
you-complete-me-install-all:
	@\python3 $(PLUGINS_DATA_PATH)/YouCompleteMe/install.py --all ;

vim-PlugInstall:
	@\nvim -u $(PLUGINS_VIM_PATH) +PlugInstall +qall ;

# Deleting CONF_PATH removes
# all of the configs made
rm-dirs:
	@\echo 'Removing `$(CONF_PATH)` if exists' ;
	@\rm -rf $(CONF_PATH) ;
	@\echo 'Removing `$(DATA_PATH)` if exists' ;
	@\rm -rf $(DATA_PATH) ;

# Noop
rm-symlinks:
	@:
