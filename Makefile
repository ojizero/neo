XDG_CONFIG_HOME ?= ~/.config
XDG_DATA_HOME ?= ~/.local/share

CONF_PATH := $(XDG_CONFIG_HOME)/nvim
DATA_PATH := $(XDG_DATA_HOME)/nvim

AUTO_PATH := $(CONF_PATH)/autoload
VIMRC_PATH := $(CONF_PATH)/init.vim
COLORS_PATH := $(CONF_PATH)/colors
PLUGINS_PATH := $(DATA_PATH)/plugins.vim

# backup old stuff
# symlink current conf
# {{~/.config}}/nvim/init.vim
setup: backup mk-dirs mk-symlinks

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

mk-symlinks:
	@\ln -sv $(abspath ./vim/autoload)    $(AUTO_PATH)    ;
	@\ln -sv $(abspath ./vimrc)           $(VIMRC_PATH)   ;
	@\ln -sv $(abspath ./vim/colors)      $(COLORS_PATH)  ;
	@\ln -sv $(abspath ./vim/plugins.vim) $(PLUGINS_PATH) ;

# Deleting CONF_PATH removes
# all of the configs made
rm-dirs:
	@\rm -rfv $(CONF_PATH) ;

rm-symlinks:
	@\rm -rfv $(PLUGINS_PATH) ;
