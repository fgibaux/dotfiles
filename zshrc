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
zplug zsh-users/zsh-history-substring-search, defer:3

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

##############################################################################
# zsh configuration
##############################################################################

# History Configuration
#######################

HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
#setopt    append_history     #Append history to the history file (no overwriting)
setopt    share_history      #Share history across terminals
#setopt    inc_append_history  #Immediately append to the history file, not just when a term is killed
setopt    hist_ignore_dups
setopt HIST_FIND_NO_DUPS
setopt hist_expire_dups_first  # delete duplicates first when HISTFILE size exceeds HISTSIZE

# Completion configuration
##########################

# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# case-insensitive matching only if there are no case-sensitive
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

zstyle ':completion:*' menu select

# Keys configuration
####################

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

zmodload zsh/terminfo
typeset -gA key_info
key_info=(
  'Control'   '\C-'
  'Escape'    '\e'
  'Meta'      '\M-'
  'Backspace' "^?"
  'Delete'    "^[[3~"
  'F1'        "$terminfo[kf1]"
  'F2'        "$terminfo[kf2]"
  'F3'        "$terminfo[kf3]"
  'F4'        "$terminfo[kf4]"
  'F5'        "$terminfo[kf5]"
  'F6'        "$terminfo[kf6]"
  'F7'        "$terminfo[kf7]"
  'F8'        "$terminfo[kf8]"
  'F9'        "$terminfo[kf9]"
  'F10'       "$terminfo[kf10]"
  'F11'       "$terminfo[kf11]"
  'F12'       "$terminfo[kf12]"
  'Insert'    "$terminfo[kich1]"
  'Home'      "$terminfo[khome]"
  'PageUp'    "$terminfo[kpp]"
  'End'       "$terminfo[kend]"
  'PageDown'  "$terminfo[knp]"
  'Up'        "$terminfo[kcuu1]"
  'Left'      "$terminfo[kcub1]"
  'Down'      "$terminfo[kcud1]"
  'Right'     "$terminfo[kcuf1]"
  'BackTab'   "$terminfo[kcbt]"
)

# Do not bind any keys if there are empty values in $key_info.
for key in "$key_info[@]"; do
  if [[ -z "$key" ]]; then
    print "omz: one or more keys are non-bindable" >&2
    return 1
  fi
done

bindkey ' ' magic-space

bindkey "$key_info[Up]" history-substring-search-up
bindkey "$key_info[Down]" history-substring-search-down

bindkey "$key_info[Home]" beginning-of-line
bindkey "$key_info[End]" end-of-line

bindkey '^[[1;5C' forward-word  # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word

bindkey "$key_info[Delete]" delete-char

##############################################################################
# theme configuration
##############################################################################

export SPACESHIP_TIME_SHOW=true

##############################################################################
# User configuration
##############################################################################

# List directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

export PATH="$PATH:~/bin"

[ -d ~/.composer ] && export PATH="$PATH:~/.composer/vendor/bin"

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
