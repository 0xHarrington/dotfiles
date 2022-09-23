##########################
##### Path Manaement #####
##########################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Need to disable compfix before sourcing oh-my-zsh for...reasons
ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

# ooo man pages
export MANPATH="/usr/local/man:$MANPATH"

# GOLANG PATH
export PATH=$PATH:$HOME/go:$HOME/go/bin
export GOPATH=$HOME/go

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=("eastwood" "gnzh" "wezm" "terminalparty")

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    macos
    pip
    python
    thefuck
    vscode
    brew
    zsh-syntax-highlighting
)

# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

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
# [[ -f $HOME/Github/node_modules/tabtab/.completions/electron-forge.zsh ]] && . $HOME/Github/node_modules/tabtab/.completions/electron-forge.zsh
eval $(thefuck --alias)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
