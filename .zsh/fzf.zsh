[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX_OPTS='-p70%,60%'

fzf_history() {
  local selected
  setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
  selected=( $(fc -rl 1 |
	 FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort --expect=tab $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
     local accept=0
     if [[ $selected[1] = tab ]]; then
       accept=1
       shift selected
     fi
     num=$selected[1]
     if [ -n "$num" ]; then
       zle vi-fetch-history -n $num
       [[ $accept = 0 ]] && zle accept-line
     fi
   fi
   zle reset-prompt
}
zle -N fzf-history fzf_history
bindkey "^R" fzf-history
