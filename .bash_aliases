[[ -f ${HOME}/.git-completion.bash ]] && . ${HOME}/.git-completion.bash

# Move copy delete confirmation
alias mv="mv -i"
alias mf="mv -i"
alias cp="cp -i"
alias rm="rm -i"

# nice ls shortcuts
alias ls="ls -1p --color=auto"
alias ll="ls -lh"
alias l="/bin/ls -lhGgop --color=auto"
alias lL="ls -lhGgopL"
alias la="l -A"
alias lt="l -tr"
alias lS="l -Sr"
alias l.="l -d .*"
alias lhead="l | head"
alias ltail="l | tail"
alias lless='l | less'

# Directories
alias u="cd ..;l"
alias d="cd -;l"
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

# Conda
alias mm="mamba"
alias mma="mamba activate"
alias mmd="mamba deactivate"
alias mmenv="mamba env list"
alias mmrem="mamba env remove --name"

# Docker
alias di="docker images"
alias dps="watch -n1 \"docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}'\""
function docker_run  { docker run --rm -v $(pwd):$(pwd) -w $(pwd) -u $(id -u):$(id -g) "$@"; }
function docker__run { docker run --rm -v $(pwd):$(pwd) -w $(pwd) "$@"; }

# Logging
function getlast { fc -ln "$1" "$1" | sed '1s/^[[:space:]]*//'; }
alias addlog="getlast >> README.sh"
alias al="getlast >> README.sh"
alias baklog="cp README.sh README.sh2"

# Misc
alias tma="tmux a"
alias scp="scp -rp"
alias grep="grep --color=auto"
alias hgrep="history | grep"
alias htail="history | tail"
alias wcl="wc -l"
alias cuts="cut -d \" \""
alias cutc="cut -d \",\""
alias tarup="tar -zcf"
alias tardown="tar -zxf"
alias du="du -h -d 1"
alias dusort="du -h -d 1 | sort -h"
alias c="/usr/bin/clear"
alias cl="clear;l"
alias fq2fa="sed -n '1~4s/^@/>/p;2~4p'"
alias refresh="source ~/.bashrc"
alias today="date +%F"
alias suw="sort | uniq | wc -l"
alias zcat="gunzip -dc"
alias nreads='echo $((`wc -l`/4))'
alias showpath='echo $PATH | tr ":" "\n" | nl'
alias top="htop"
alias NL="perl -pe 's/^\\s+\\d+\\s+//g'"
alias minps1="export PS1='$ '"
alias nf="nextflow"
alias nfc="nf-core"
alias nft="nf-test"
alias nfr="nextflow run"

# Misc Functions
function pgrep { ps aux | grep $1 | grep -v grep | grep $1; }
function calc { echo "scale=4; $*" | bc; }
function nfiletypes { find . -maxdepth 1 -type f | sed 's/.*\.//' | sort | uniq -c | sed 's/^ *//g' | tr ' ' '\t' ; }
function getpdftitle { pdftk "$1" dump_data | grep -A1 "InfoKey: Title" | grep InfoValue | sed 's/InfoValue: //g' ; }
function bless { samtools view $@ | less -S; }
function vless { bcftools view $@ | less -S; }

# Figure out how to extract automatically
# as suggested by Mendel Cooper in "Advanced Bash Scripting Guide"
extract () {
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)      tar xvjf $1 ;;
        *.tar.gz)       tar xvzf $1 ;;
        *.tar.xz)       tar Jxvf $1 ;;
        *.bz2)          bunzip2 $1 ;;
        *.rar)          unrar x $1 ;;
        *.gz)           gunzip $1 ;;
        *.tar)          tar xvf $1 ;;
        *.tbz2)         tar xvjf $1 ;;
        *.tgz)          tar xvzf $1 ;;
        *.zip)          unzip $1 ;;
        *.Z)            uncompress $1 ;;
        *.7z)           7z x $1 ;;
        *)              echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
