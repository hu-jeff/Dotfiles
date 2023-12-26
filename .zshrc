# ZSH PLUGINS
# source ~/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# bindkey '^I' autosuggest-accept
# bindkey -M menuselect '^M' .accept-line

# source ~/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# == CONFIGS ==
for config (~/.zsh/*.zsh) source $config

# bat colorscheme
export BAT_THEME="TwoDark"

alias config='/usr/bin/git --git-dir=$HOME/Dotfiles/ --work-tree=$HOME'

export MANPAGER="vim +MANPAGER -"
export PROMPT="%~ %# "

function ff() { osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)' }

function cdf() {
	cd "$(ff)"
}
