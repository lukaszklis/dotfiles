# Based on https://github.com/gdsrosa/minimal_improved.git
LCHAR='$'
LCHAR_WIDTH=%1G

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}✘"

PROMPT='%{$fg[cyan]%}%c $([[ $(git_prompt_info) ]] && echo "$(git_prompt_info) ")%{$fg[white]%}%{$LCHAR$LCHAR_WIDTH%} %{$reset_color%}'
RPROMPT=''
