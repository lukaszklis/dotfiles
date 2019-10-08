# Based on https://github.com/gdsrosa/minimal_improved.git
LCHAR='$'
LCHAR_WIDTH=%1G

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"

PROMPT='%{$fg[cyan]%}%c $([[ $(git_prompt_info) ]] && echo "$(git_prompt_info) ")%{$fg[white]%}%{$LCHAR$LCHAR_WIDTH%} %{$reset_color%}'
RPROMPT=''
