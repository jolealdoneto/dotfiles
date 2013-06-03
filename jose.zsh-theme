function njobs {
    echo `jobs | wc -l` 2>/dev/null
}
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}
setopt promptsubst

ZSH_THEME_VI_MODE_COMMAND="%{$fg_bold[magenta]%}<#%{$reset_color%}"
ZSH_THEME_VI_MODE_INSERT="%{$fg_bold[green]%}$>%{$reset_color%}"

vi_mode_prompt_info () {
  if [[ ${KEYMAP} = 'vicmd' ]]
  then
    echo $ZSH_THEME_VI_MODE_COMMAND
  else
    echo $ZSH_THEME_VI_MODE_INSERT
  fi
}

PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} %F{green}$(collapse_pwd)%F{blue} %j $(vi_mode_prompt_info) [%f '
RPROMPT='$(git_prompt_info) %F{blue}] $(acpi | grep -o "[0-9]*%")% %F{green}%D{%L:%M} %F{yellow}%D{%p}%f'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
