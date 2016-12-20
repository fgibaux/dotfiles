source $HOME/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle git-flow
antigen bundle jsontools
antigen bundle python
antigen bundle pip
antigen bundle command-not-found
antigen bundle screen
antigen bundle wd
antigen bundle ls-colors
antigen bundle symfony2
antigen bundle systemd
antigen bundle yum
antigen bundle docker
antigen bundle docker-compose
antigen bundle history
antigen bundle composer

#antigen bundle flogib-aliases
#antigen bundle ifs

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme https://gist.github.com/fgibaux/bef829ad67f2a37c30fbba07e53c54c4 fgibaux

# Tell antigen that you're done.
antigen apply


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
source /usr/bin/virtualenvwrapper.sh
