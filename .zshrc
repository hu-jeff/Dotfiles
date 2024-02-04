# ZSH PLUGINS
# source ~/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# bindkey '^I' autosuggest-accept
# bindkey -M menuselect '^M' .accept-line

# source ~/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# == CONFIGS ==
for config (~/.zsh/*.zsh) source $config

# bat colorscheme
export BAT_THEME="TwoDark"

alias ls='ls -Gh'

alias config='/usr/bin/git --git-dir=$HOME/Dotfiles/ --work-tree=$HOME'

export MANPAGER="vim +MANPAGER -"
export PROMPT="%~ %# "

function ff() { osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)' }

function cdf() {
	cd "$(ff)"
}
