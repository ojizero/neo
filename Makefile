XDG_CONFIG_HOME ?= ~/.config

CONF_PATH := $(XDG_CONFIG_HOME)/nvim

AUTO_PATH := $(CONF_PATH)/autoload
VIMRC_PATH := $(CONF_PATH)/init.vim
COLORS_PATH := $(CONF_PATH)/colors

# backup old stuff
# symlink current conf
# {{~/.config}}/nvim/init.vim
setup: backup mk-dirs mk-symlinks

# Update conf
update:
	git pull

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

mk-symlinks:
	@\ln -sv ./vim/autoload $(AUTO_PATH)   ;
	@\ln -sv ./vimrc        $(VIMRC_PATH)  ;
	@\ln -sv ./vim/colors   $(COLORS_PATH) ;

# Deleting CONF_PATH removes
# all of the configs made
rm-dirs:
	@\rm -rfv $(CONF_PATH) ;

# Noop
rm-symlinks:
	@:
