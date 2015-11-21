#######################################################
# Personal environment variables and startup programs.
#######################################################

# NOTE: Archived in git repository: 
# "/Users/cameron/Coding/Languages/BASH and Terminal/Terminal Setup"

# Personal aliases and functions should go in ~/.bashrc.  System wide
# environment variables and startup programs are in /etc/profile.
# System wide aliases and functions are in /etc/bashrc.


# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Master Password Name
export MP_FULLNAME="Cameron Charles Unterberger"

# set up the editor for programs that want them
export EDITOR='nano'
export VISUAL='nano'

# Ensure history appends to disk (rather than overwrite, when multi windows open).
# See bash(1) for more options
shopt -s histappend
export PROMPT_COMMAND='history -a'

# save multiline commands as one command
shopt -s cmdhist

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTFILE=~/.bash_history

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# ensures proper line-wrapping when scrolling through previous commands
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# No duplicate entries in history. Also ignore (don't put in history)
# duplicate commands and commands preceded by a space (useful if you don't 
# want a command recorded in your history
export HISTCONTROL="erasedups:ignoreboth"

# have bash display expanded history commands before executing (paranoid)
shopt -s histverify # somewhat redundant with magic-space

# don't put 'exit' command in history
# can string commands together with "cmd1:cmd2"
# wildcard "*" also ok
export HISTIGNORE="exit"

# small typos ignored in directory names
shopt -s cdspell