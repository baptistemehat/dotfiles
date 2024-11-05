# Based on bira theme
setopt promptsubst

LIGHT_GREEN="#66ffbf"
GREEN="#00cc76"
BLUE="#00a0ff"
PINK="#ff669c"
YELLOW="#e6ac00"
ORANGE="#ff7039"
GREY="#888888"

() {
# DEBUG=1
prompt_time() {
  echo -n "%B%F{$GREY}%T%f%b"
}

prompt_ssh() {
  # Check if we are on SSH or not
  if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" || -n "$DEBUG" ]]; then
    echo -n "%B%F{$ORANGE}SSH%f%b "
  fi
}

prompt_docker() {
  # Check if we are inside a docker container or not
  if [[ -f /.dockerenv || -n "$DEBUG" ]]; then
    echo -n "%B%F{$YELLOW}DOCKER%f%b "
  fi

}

prompt_user_host() {
  # Check the UID
  if [[ $UID -ne 0 ]]; then # normal user
    # user="%F{$GREEN}%n%f"
    # prompt_char="%f$ %f"
    # host="%F{$GREEN}%M%f"
  else # root
    user="%F{red}%n%f"
    prompt_char="%F{red}$ %f"
    host="%F{$GREEN}%M%f"
    at="%F{$LIGHT_GREEN}@"
    echo -n "$user$at$host:"
  fi
}

prompt_dir() {
  echo -n "%B%F{$BLUE}%~%f%b"
}

prompt_git() {
  echo -n '%F{$PINK}$(git_prompt_info)%f'
}

prompt_return_code() {
  echo -n "%(?..%F{$ORANGE}%? ↵%f)"
}

build_prompt() {
  prompt_ssh
  prompt_docker
  prompt_user_host
  prompt_dir
  prompt_git
}

build_right_prompt() {
  prompt_time
}

get_space () {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=$(( COLUMNS - LENGTH - ${ZLE_RPROMPT_INDENT:-1} + 1 ))

  (( SPACES > 0 )) || return
  echo -n '%b%F{$GREY}'
  printf '─%.0s' {1..$SPACES}
  # echo -n '%f'
}

LEFT_PROMPT="%B%F{$GREY}─(%b$(build_prompt)%B%F{$GREY})" 
RIGHT_PROMPT="%B%F{$GREY}(%b$(build_right_prompt)%B%F{$GREY})─%b"

baptiste_precmd () {
  SPACES=$(get_space "${LEFT_PROMPT}" "${RIGHT_PROMPT}")
  print -rP "${LEFT_PROMPT}${SPACES}${RIGHT_PROMPT}"
}

autoload -U add-zsh-hook
add-zsh-hook precmd baptiste_precmd


PROMPT=""
RPROMPT="$(prompt_return_code)"

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
}
