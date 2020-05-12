# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export EDITOR=vim;
export VISUAL=vim; #Nano is the main editor
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=
HISTFILESIZE=
export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history'
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|alacritty)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -hN --color=auto --group-directories-first'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# vi mode in the shell
set -o vi
# transform md anotations into PDF
mdpdf () { pandoc "$1".md -t beamer -o "$1".pdf ;}
#byebye for shutdown
alias byebye='shutdown now'
# Get all metadata
metadata () { echo "Salida del comando stat" ; stat "$1" ; echo "Salida del comando ls -lisan" ; ls -lisan "$1" ; echo "salida del comando exiftool" ; exiftool "$1" ;}
# use highlight for colored cat
alias ccat='highlight --out-format=ansi'
# activates the autocd mode
shopt -s autocd
# wifi available
alias wifi='nmcli d wifi'
# personalized ps1
export PS1="[$?]\[\]\[\033[38;5;40m\]\u@\h\[\]:\[\]\[\033[38;5;45m\]\w\[\]\n\[\]\[\033[38;5;166m\]\$\[\]"
alias autowal='wal --iterative -i /usr/share/backgrounds/ > /dev/null'
#figlet de mi nombre
whoami | figlet Josuer08 | lolcat -F 0.25;
#whoami | figlet Josuer08 | lolcat;
# agragando el comando gitdotfiles para manejar los dotfiles
alias gitdotfiles='/usr/bin/git --git-dir=$HOME/Documents/dotfiles/ --work-tree=$HOME';

function cdls() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --color=auto
}






#colorman
if $_isxrunning; then
  export PAGER=less
  export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
  export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
  export LESS_TERMCAP_me=$'\E[0m'           # end mode
  export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
  export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
  export LESS_TERMCAP_ue=$'\E[0m'           # end underline
  export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
fi
#top10 commands
top10() { history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head; }
# goes up by the number of directories
up() {
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++)); do
    d=$d/..
  done
  d=$(echo $d | sed 's/^\///')
  if [[ -z "$d" ]]; then
    d=..
  fi
  cd $d
}
# ARCHIVE EXTRACTOR {{{
extract() {
  clrstart="\033[1;34m"  #color codes
  clrend="\033[0m"

  if [[ "$#" -lt 1 ]]; then
    echo -e "${clrstart}Pass a filename. Optionally a destination folder. You can also append a v for verbose output.${clrend}"
    exit 1 #not enough args
  fi

  if [[ ! -e "$1" ]]; then
    echo -e "${clrstart}File does not exist!${clrend}"
    exit 2 #file not found
  fi

  if [[ -z "$2" ]]; then
    DESTDIR="." #set destdir to current dir
  elif [[ ! -d "$2" ]]; then
    echo -e -n "${clrstart}Destination folder doesn't exist or isnt a directory. Create? (y/n): ${clrend}"
    read response
    #echo -e "\n"
    if [[ $response == y || $response == Y ]]; then
      mkdir -p "$2"
      if [ $? -eq 0 ]; then
        DESTDIR="$2"
      else
        exit 6 #Write perms error
      fi
    else
      echo -e "${clrstart}Closing.${clrend}"; exit 3 # n/wrong response
    fi
  else
    DESTDIR="$2"
  fi

  if [[ ! -z "$3" ]]; then
    if [[ "$3" != "v" ]]; then
      echo -e "${clrstart}Wrong argument $3 !${clrend}"
      exit 4 #wrong arg 3
    fi
  fi

  filename=`basename "$1"`

  #echo "${filename##*.}" debug

  case "${filename##*.}" in
    tar)
      echo -e "${clrstart}Extracting $1 to $DESTDIR: (uncompressed tar)${clrend}"
      tar x${3}f "$1" -C "$DESTDIR"
      ;;
    gz)
      echo -e "${clrstart}Extracting $1 to $DESTDIR: (gip compressed tar)${clrend}"
      tar x${3}fz "$1" -C "$DESTDIR"
      ;;
    tgz)
      echo -e "${clrstart}Extracting $1 to $DESTDIR: (gip compressed tar)${clrend}"
      tar x${3}fz "$1" -C "$DESTDIR"
      ;;
    xz)
      echo -e "${clrstart}Extracting  $1 to $DESTDIR: (gip compressed tar)${clrend}"
      tar x${3}f -J "$1" -C "$DESTDIR"
      ;;
    bz2)
      echo -e "${clrstart}Extracting $1 to $DESTDIR: (bzip compressed tar)${clrend}"
      tar x${3}fj "$1" -C "$DESTDIR"
      ;;
    zip)
      echo -e "${clrstart}Extracting $1 to $DESTDIR: (zipp compressed file)${clrend}"
      unzip "$1" -d "$DESTDIR"
      ;;
    rar)
      echo -e "${clrstart}Extracting $1 to $DESTDIR: (rar compressed file)${clrend}"
      unrar x "$1" "$DESTDIR"
      ;;
    7z)
      echo -e  "${clrstart}Extracting $1 to $DESTDIR: (7zip compressed file)${clrend}"
      7za e "$1" -o"$DESTDIR"
      ;;
    *)
      echo -e "${clrstart}Unknown archieve format!"
      exit 5
      ;;
  esac
}
#}}}



# REMIND ME, ITS IMPORTANT! {{{
# usage: remindme <time> <text>
# e.g.: remindme 10m "omg, the pizza"
remindme() {
  if [[ "$#" -lt 2 ]]; then
    echo -e "Usage: remindme [time] '[message]'"
    echo -e "Example: remindme 50s 'check mail'"
    echo -e "Example: remindme 10m 'go to class'"
    #exit 0 #not enough args
  fi
  if [[ "$#" -gt 2 ]]; then
    echo -e "Usage: remindme [time] '[message]'"
    echo -e "Example: remindme 50s 'check mail'"
    echo -e "Example: remindme 10m 'go to class'"
    #exit 0 #more than enough args
  fi
  if  [[ "$#" == 2 ]]; then
    sleep $1 && notify-send -t 15000 "$2" & echo 'Reminder set'
  fi
  }

#}}}

### add to xterm
xrdb -merge ~/.Xresources >> /dev/null 2>&1
