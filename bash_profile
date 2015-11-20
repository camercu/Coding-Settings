#######################################################
# Personal environment variables and startup programs.
#######################################################

# NOTE: Archived in git repository: 
# "/Users/cameron/Coding/Languages/BASH and Terminal/Terminal Setup"

# Personal aliases and functions should go in ~/.bashrc.  System wide
# environment variables and startup programs are in /etc/profile.
# System wide aliases and functions are in /etc/bashrc.


# Load .bashrc if it exists
#test -e ~/.bashrc && source ~/.bashrc

# Master Password Name
export MP_FULLNAME="Cameron Charles Unterberger"

# set up the editor for programs that want them
export EDITOR='nano'
export VISUAL='nano'

# Ensure history appends to disk (rather than overwrite, when multi windows open).
#shopt -s histappend
export PROMPT_COMMAND='history -a'

# save multiline commands as one command
shopt -s cmdhist

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
#HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# No duplicate entries in history. Also ignore (don't put in history)
# duplicate commands and commands preceded by a space (useful if you don't 
# want a command recorded in your history
export HISTCONTROL="erasedups:ignoreboth"

# Big(ish) history file
export HISTSIZE=1000
export HISTFILE=~/.bash_history

# have bash display expanded history commands before executing (paranoid)
# shopt -s histverify # redundant with magic-space

# don't put 'exit' command in history
# can string commands together with "cmd1:cmd2"
# wildcard "*" also ok
export HISTIGNORE="exit"

# small typos ignored in directory names
shopt -s cdspell

# ensure proper line-wrapping when scrolling through previous commands
shopt -s checkwinsize



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

