source ~/.zplug/init.zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
zplug "plugins/git",  from:oh-my-zsh
zplug "plugins/git-flow",  from:oh-my-zsh
zplug "plugins/jsontools",  from:oh-my-zsh
zplug "plugins/python",  from:oh-my-zsh
zplug "plugins/pip",  from:oh-my-zsh
zplug "plugins/screen",  from:oh-my-zsh
zplug "plugins/wd",  from:oh-my-zsh
zplug "plugins/ls-colors",  from:oh-my-zsh
zplug "plugins/symfony2",  from:oh-my-zsh
zplug "plugins/systemd",  from:oh-my-zsh
zplug "plugins/docker",  from:oh-my-zsh
zplug "plugins/docker-compose",  from:oh-my-zsh
zplug "plugins/history",  from:oh-my-zsh
zplug "plugins/laravel5",  from:oh-my-zsh

#antigen bundle flogib-aliases
#antigen bundle ifs

# Syntax highlighting bundle.
zplug zsh-users/zsh-syntax-highlighting, defer:2

# Load the theme.
# zplug "fgibaux/bef829ad67f2a37c30fbba07e53c54c4", from:gist, as:theme

zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load


setopt HIST_FIND_NO_DUPS

# User configuration

export PATH=$PATH:~/bin

[ -f ~/.zshalias ] && source ~/.zshalias

[ -f ~/.zshrc_completion ] && source ~/.zshrc_completion

# for gpg-agent
GPG_TTY=$(tty)
export GPG_TTY

echo
echo "     Welcome "$USER" on `hostname` !"
echo

export WORKON_HOME=$HOME/.virtualenvs
[ -f /usr/bin/virtualenvwrapper.sh ] && source /usr/bin/virtualenvwrapper.sh
