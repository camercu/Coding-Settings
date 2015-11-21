##################################
# Personal aliases and functions.
##################################

# Personal environment variables and startup programs should go in
# ~/.bash_profile.  System wide environment variables and startup
# programs are in /etc/profile.  System wide aliases and functions are
# in /etc/bashrc.

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


####################
# Source files
####################
# include global bashrc settings
if [ -f "/etc/bashrc" ] ; then
  source /etc/bashrc
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


######################
# Alias definitions.
######################
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias bashreload=". ~/.bash_profile" # same as "source ~/.bash_profile"
alias bpe='nano ~/.bash_profile'
alias brce='nano ~/.bashrc'
alias df='df -h'
alias duff='diff -ur'
alias gitca='git add . && git commit'
alias gitinit='git init && git add . && git commit -m "initial commit"'
alias gitsync='git checkout master && git fetch upstream && git merge upstream/master'
alias mkdir='mkdir -p'
alias pipup='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo -H pip install -U'
alias remake='make -B'
alias su='su -'

# list the size of directories in descending order
alias ducks='du -cks * | sort -rn | head -11'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls="ls -A --color=auto"
    alias dir="dir --color=auto"
    alias vdir="vdir --color=auto"

    alias grep='grep --color=auto'
    alias fgrep='grep -F'
    alias egrep='grep -E'
    alias rgrep='grep -r'
fi

# some more ls aliases
alias ll='ls -l'
#alias la='ls -A'
alias l='ls -CF'
alias lsl='ll'

## some useful aliases, so new users don't hurt themselves
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
# alias ls='ls -F'


#---------------------------------------
# BEGIN Bash Prompt Customization w/ Git
#---------------------------------------
# text (foreground) colors!
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
DEFAULT=$(tput setaf 9)
_RESET_ALL=$(tput sgr0) # reset all attributes
# see url for more codes: http://wiki.bash-hackers.org/scripting/terminalcodes
# and for more ideas on terminal prompts: http://mywiki.wooledge.org/BashFAQ/053

# Change command prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

# Fancy unicode globe character! (for admin prompt)
GLOBECHAR=$'\xf0\[\x9f\x8c\x8e\] '

# Admin Prompt
# export PS1="${GLOBECHAR}\[$CYAN\]\$(__git_ps1)\[$WHITE\] \w \$ \[$_RESET_ALL\]"

# My prompt
export PS1="\[$YELLOW\]\u\[$CYAN\]\$(__git_ps1)\[$WHITE\] \W \$ \[$_RESET_ALL\]"
  # note: PS1 needs '\[' and '\]' to escape non-printable characters, 
  # keeping char count in line w/ displayed text (new line happens at right place).
  # '\u' adds the name of the current user to the prompt.
  # '\$(__git_ps1)' adds git-related stuff.
  # '\W' adds the name of the current directory.

unset BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE DEFAULT _RESET_ALL GLOBECHAR

#-------------------------------------
# END Prompt Customization
#-------------------------------------

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
