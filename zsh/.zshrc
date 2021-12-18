# Messing with the PATH variable 
# below copied from .bash_profile:

# Relevant android develpment paths for react native development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Ruby path variable (for Jekyll)
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/Matt/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="wezm"
# ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=(
  "robbyrussell"
  "wezm"
)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# to

# Setting to true per the reccomendation, since I was getting the following errors:
    # drwxr-xr-x  7 502  admin  224 Aug 18 17:28 /usr/local/share/zsh
    # drwxr-xr-x  6 502  admin  192 Oct  6 13:24 /usr/local/share/zsh/site-functions
    # lrwxr-xr-x  1 502  admin   39 Sep 25  2016 /usr/local/share/zsh/site-functions/_brew -> ../../../Homebrew/completions/zsh/_brew
    # lrwxr-xr-x  1 502  admin   88 May  5  2020 /usr/local/share/zsh/site-functions/_brew_services -> ../../../Homebrew/Library/Taps/homebrew/homebrew-services/completions/zsh/_brew_services
    # lrwxr-xr-x  1 502  admin   60 Jan 28  2021 /usr/local/share/zsh/site-functions/_ninja -> ../../../Cellar/ninja/1.10.2/share/zsh/site-functions/_ninja
    # lrwxr-xr-x  1 502  admin   74 Mar 12  2019 /usr/local/share/zsh/site-functions/_youtube-dl -> ../../../Cellar/youtube-dl/2019.03.09/share/zsh/site-functions/_youtube-dl
    #
    # [oh-my-zsh] For safety, we will not load completions from these directories until
    # [oh-my-zsh] you fix their permissions and ownership and restart zsh.
    # [oh-my-zsh] See the above list for directories with group or other writability.
    #
    # [oh-my-zsh] To fix your permissions you can do so by disabling
    # [oh-my-zsh] the write permission of "group" and "others" and making sure that the
    # [oh-my-zsh] owner of these directories is either root or your current user.
    # [oh-my-zsh] The following command may help:
    # [oh-my-zsh]     compaudit | xargs chmod g-w,o-w
    #
    # [oh-my-zsh] If the above didn't help or you want to skip the verification of
    # [oh-my-zsh] insecure directories you can set the variable ZSH_DISABLE_COMPFIX to
    # [oh-my-zsh] "true" before oh-my-zsh is sourced in your zshrc file.

ZSH_DISABLE_COMPFIX="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

############################
###### Aliasses!! ######
############################

alias lsa='ls -la'
alias zshrc='nvim ~/.zshrc'
alias nvimrc='nvim ~/.config/nvim/init.vim'
alias gits='git status'
alias gitm='git commit -m'
alias gitp='git push'
alias gita='git add'

alias pip='pip3'
alias python='python3'

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
# [[ -f /Users/Matt/Github/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/Matt/Github/node_modules/tabtab/.completions/electron-forge.zsh
eval $(thefuck --alias)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


############################
##### Path Manaement!! #####
############################

# From post about how to reset python install
# https://gist.github.com/MuhsinFatih/ee0154199803babb449b5bb98d3475f7
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"

# GOPATH setup
export GOPATH=$HOME/go

# Node versiion manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# From the vimtex docs on Zathura for MacOS
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/matt/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/matt/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/matt/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/matt/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

