##########################
##### Path Management #####
##########################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export MANPATH="/usr/local/man:$MANPATH"

ZSH_THEME="matt_custom"
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
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

# Need to disable compfix before sourcing oh-my-zsh for...reasons
ZSH_DISABLE_COMPFIX="true"

# Finally source the oh-my-zsh script
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

############################
###### Aliases ######
############################

alias pip='pip3'
alias lsa='ls -la'
alias pipes='pipes.sh'
alias zshrc='nvim ~/.zshrc'
alias nvimrc='nvim ~/.config/nvim/init.vim'

alias gita='git add'
alias gitp='git push'
alias gits='git status'
alias gitm='git commit -m'

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
# [[ -f $HOME/Github/node_modules/tabtab/.completions/electron-forge.zsh ]] && . $HOME/Github/node_modules/tabtab/.completions/electron-forge.zsh
eval $(thefuck --alias)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

############################
###### venv Activation #####
############################

function auto_activate_venv() {
    local dir="$PWD"
    while [[ "$dir" != "/" ]]; do
        if [[ -d "$dir/.venv" ]]; then
            VIRTUAL_ENV="$dir/.venv"
            PATH="$VIRTUAL_ENV/bin:$PATH"
            export VIRTUAL_ENV PATH
            return
        elif [[ -d "$dir/.base_venv" ]]; then
            VIRTUAL_ENV="$dir/.base_venv"
            PATH="$VIRTUAL_ENV/bin:$PATH"
            export VIRTUAL_ENV PATH
            return
        fi
        dir=$(dirname "$dir")
    done

    # If we've reached the root without finding a .venv, check for .base_venv in home
    if [[ -d "$HOME/.base_venv" ]]; then
        VIRTUAL_ENV="$HOME/.base_venv"
        PATH="$VIRTUAL_ENV/bin:$PATH"
        export VIRTUAL_ENV PATH
    fi
}

# Function to update prompt when venv changes
function update_prompt() {
    setopt prompt_subst
    PROMPT='${ret_status}$(virtualenv_info)${user_color}%n${host_color}@%m ${dir_color}%~ ${git_color}$(git_prompt_info)
%{$reset_color%}$ '
}

# Call update_prompt after auto_activate_venv
function cd() {
    builtin cd "$@"
    auto_activate_venv
    update_prompt
}

# Initial call to activate the root venv and set up the prompt
auto_activate_venv
update_prompt
