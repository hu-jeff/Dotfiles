bindkey -e

for config (~/.zsh/*.zsh) source $config

export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="vim +MANPAGER -"
export BAT_THEME="TwoDark"
export PROMPT=$'%F{243}%~%f%-40(l::\n) %# '
export CLAUDE_CODE_NO_FLICKER=1

export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"

alias ls='ls -Gh'
alias please=sudo

setopt inc_append_history

ff() { osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)' }
cdf() { cd "$(ff)" }
