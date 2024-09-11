# Colors
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
local user_color="%{$fg[cyan]%}"
local host_color="%{$fg[blue]%}"
local dir_color="%{$fg[yellow]%}"
local git_color="%{$fg[magenta]%}"
local venv_color="%{$fg[green]%}"

# Git information
ZSH_THEME_GIT_PROMPT_PREFIX="${git_color}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="${git_color}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Virtual environment
function virtualenv_info {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "${venv_color}(${VIRTUAL_ENV:t})%{$reset_color%} "
    fi
}

# Main prompt
PROMPT='${ret_status}$(virtualenv_info)${user_color}%n${host_color}@%m ${dir_color}%~ ${git_color}$(git_prompt_info)
%{$reset_color%}$ '

# Right prompt with time
RPROMPT='%{$fg[grey]%}[%*]%{$reset_color%}'
