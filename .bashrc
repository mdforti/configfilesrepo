# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=-1 #10000
HISTFILESIZE=-1
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s extglob
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

get_conda_env () {
  if [ "$CONDA_DEFAULT_ENV" == "base" ]
  then
    echo ""
  else
    echo $(basename "$CONDA_DEFAULT_ENV")
  fi
}

get_git_status () {
  ismod=$(git status 2>/dev/null | grep modifi)
  if [ ${#ismod} -gt 0 ]
  then
    gitopencolor='\e[01;41m'
    gitclosecolor='\e[m'
    #00;48m'
  else
    gitopencolor='\e[01;32m'
    gitclosecolor='\e[00;48m'

  fi
  echo  -e "$gitopencolor "$(git symbolic-ref --short HEAD 2>/dev/null)" $gitclosecolor"
}

unset PS1


if [ "$color_prompt" = yes ]; then
    source /data/git/gitstatus/gitstatus.prompt.sh
    PS1='\033[01;39m_______________________________________\033[m\r\n'
    PS1+='\033[01;37m\]$(get_conda_env)\033[m'
    PS1+='[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\W\[\033[00m\ '
    PS1+='${GITSTATUS_PROMPT}\r\n$ ' 
#   PS1+="\e[1;31m\$(git symbolic-ref --short HEAD 2>/dev/null)\e[m ] \r\n\$ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \W\a\]$PS1"
    ;;
*)
    ;;
esac


# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features 
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#ssh agent
#if [ -f $HOME/.gpg-agent-info ] ; then
#  source $HOME/.gpg-agent-info 
#  export GPG_AGENT_INFO
#  export SSH_AUTH_SOCK
#fi
GPG_TTY=$(tty)
export GPG_TTY
export PINENTRY_USER_DATA="USE_CURSES=1"

# special directories for gnuplot scripts
GNUPLOT_LIB=$GNUPLOT_LIB:$HOME/CuadernoTrabajo/FPV/
export GNUPLOT_LIB

PATH=$PATH:$HOME/CuadernoTrabajo/FPV/  

XCRYSDEN_TOPDIR=/usr/local/xcrysden-1.6.2-gl2ps
#XCRYSDEN_TOPDIR=/usr/local/xcrysden-1.5.60-bin-semishared/
#export XCRYSDEN_TOPDIR

#########
# FUNCTIONS
#########
vifm()
{
      local dst="$(command vifm +no . --choose-dir - "$@")"
      if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
      fi
      cd "$dst" 
}

bkup_abrehome() {
  rsync -axk --exclude={storage,icams_groupstructure,Pictures,Thermo-Calc,Downloads,snap}  --info=progress2  aberdeen:/home/users/fortimtb/* /run/media/mariano/MARIANAO/ABERDEEN-HOME/
}
bkup_aberstor() {
rsync -axk --exclude=Mail  --exclude={Anaconda,anaconda} --info=progress2  --exclude=Papers aberdeen:/home/storage/fortimtb/* /run/media/mariano/MARIANAO/ABEERDEEN-STORAGE/ 
}

bkup()
{
  echo "bkping data ==============" 
  rsync -a -v --info=progress2 --exclude=ISOS /data/DatasetsML /data/Interfaces \
              /data/Superficies /data/Bulk-ZrO2 /data/Libros \
	      /data/Papers /data/CDSBACKUPS /data/CuttingTools/ /data/DeutschLernenB1_4.iso \
	      /data/FinalModelizacion/ /data/UnserBuchstabenlied/ /data/PlanMaestro/ /data/Peliculas/ \
	      /data/Bulk-ZrO2/ \
	      /run/media/mariano/MARIANAO/MLAPTOP-DATA/

  echo "bkping home ==============" 
  rsync -av -info=progress2 --exclude=ISOS --exclude=Downloads \
              CuadernoTrabajo modelizacion Dropbox\
	      Escritos-Presentaciones Documents\
	      Mail Bitacoras USA-NewYork-2010.iso Pictures\
	      DIN-FONTS.tar.gz FotosYArchivosMariana.iso Desktop\
	      /run/media/mariano/MARIANAO/MLAPTOP/

  echo "bkping configs ==============" 
  rsync -a -v --progress --exclude=Trash --exclude=icons --exclude=ISOS \
              ~/.config ~/.local ~/.mozilla ~/.thunderbird ~/.vimrc \
              ~/.vim ~/.bash_aliases ~/.bashrc ~/.profile\
              ~/.inputrc ~/.tmux ~/.tmux.conf ~/.ssh\
	      ~/.password-store ~/.gnupg\
	      /run/media/mariano/MARIANAO/MLAPTOP/
  
  rsync -a -v --info=progress2 --exclude=ISOS ~/[^.]* /run/media/mariano/MARIANAO/MLAPTOP/
}

Notebook () {
  firefox -P Jupyter-Notebooks $1 &
}

#########
# Special Environments
#########

#########
# My Path
#########


#eval "$(_NOMAD_COMPLETE=source nomad)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/data/Anaconda/mamba_base_miniforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/data/Anaconda/mamba_base_miniforge/etc/profile.d/conda.sh" ]; then
        . "/data/Anaconda/mamba_base_miniforge/etc/profile.d/conda.sh"
    else
        export PATH="/data/Anaconda/mamba_base_miniforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/data/Anaconda/mamba_base_miniforge/etc/profile.d/mamba.sh" ]; then
    . "/data/Anaconda/mamba_base_miniforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
