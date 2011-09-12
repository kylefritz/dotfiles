
PROMPT='%{$fg_bold[cyan]%}%n%{$reset_color%}@%{$fg_bold[cyan]%}%m%{$reset_color%}:%{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
➤ '

ZSH_THEME_GIT_PROMPT_PREFIX="‹%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}› %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}›"
