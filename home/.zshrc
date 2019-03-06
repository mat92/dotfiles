source $HOME/.zplug/init.zsh

# To manage zplug itself like other packages
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# To avoid having VIM mode in the shell (when $EDITOR is set to vim)
set -o emacs

# Plugins from oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh

# Homeshick
zplug "andsens/homeshick", use:"homeshick.sh", defer:0
zplug "andsens/homeshick", use:"completions", defer:2

# Syntax highlighting for commands, load last
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3

zplug "b4b4r07/emoji-cli", on:"stedolan/jq", defer:2
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
zplug "b4b4r07/enhancd", use:init.sh

# Theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, as:theme
SPACESHIP_TIME_SHOW="true"
#SPACESHIP_BATTERY_SHOW="always"
#SPACESHIP_NODE_SHOW="false"
#SPACESHIP_TIME_COLOR="red"
#SPACESHIP_USER_SHOW="always"
#SPACESHIP_DIR_SHOW="true"
#SPACESHIP_NODE_SHOW="true"
#SPACESHIP_DIR_TRUNC_REPO="false"
#SPACESHIP_NODE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX "
#spaceship_vi_mode_disable

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH=~/.local/bin:$PATH

source $HOME/.aliases

# Actually install plugins, prompt user input
if ! zplug check --verbose; then
    printf "Install zplug plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose
