export HISTCONTROL=ignoreboth
export HISTSIZE=40000
#-------------------
# Personnal Aliases
#-------------------
#git
# Git alias
alias g="git status"
alias ga="git add"
alias gaa="git add ."
alias gau="git add -u"
alias gc="git commit -m"
alias gca="git commit -am"
alias gb="git branch"
alias gbd="git branch -d"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gt="git stash"
alias gta="git stash apply"
alias gm="git merge"
alias gr="git rebase"
alias gl="git log --oneline --decorate --graph"
alias gs="git show"
alias gd="git diff"
alias gdc="git diff --cached"
alias gbl="git blame"
alias gps="git push"
alias gpl="git pull"
alias cdgr='cd $(git rev-parse --show-toplevel)' #goto root dir

# sort and count lines,
#@see http://felipec.wordpress.com/2011/06/02/command-history-meme/
#alias cntl=awk '{a[$1]++} END{for(i in a){printf "%5d\t%s\n",a[i],i}}'|sort -rn
alias rbt='reboot'
alias bye='shutdown -h now'
alias my='mystartx' #start my favourit WM
alias p='pacman'
alias y=yaourt
#Example: rsync -avz --delete /home/username/ /media/disk/backup
alias bkrsync="rsync -avz --delete"
#grep and its alternatives
#@see http://stackoverflow.com/questions/221921/grep-exclude-include- \
#syntax-do-not-grep-through-certain-files
alias vncsvr1440='vncserver -geometry 1440x900 -depth 16 :1'
alias gfw='python ~/bin/goagent/proxy.py >/dev/null 2>&1'
alias ak='ack --nocolor'
alias qtsrc='cd /usr/share/doc/qt/src'
alias rd='rdesktop -fP'
alias armorphan='pacman -Rs $(pacman -Qqtd)'
alias asortpkg="LC_ALL=C pacman -Qi | sed -n '/^Name[^:]*: \(.*\)/{s//\1 /;x};/^Installed[^:]*: \(.*\)/{s//\1/;H;x;s/\n//;p}' | sort -nk2"
#archlinux pkg list if everything OK
alias alpkg='comm -23 <(pacman -Qeq) <(pacman -Qmq)'
alias ecp='emacs -batch -f batch-byte-compile'
alias ebcp='emacs -batch -f batch-byte-compile *.el'
alias es="emacs --daemon"
alias te='tsocks emacs -nw'
alias em='TERM=xterm-256color emacs -nw'
alias ep='http_proxy=http://127.0.0.1:8000 TERM=xterm-256color emacs -nw'
alias w3m='w3m -cookie '
alias rm='rm '
alias cp='cp '
alias mv='mv '
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'
#I need clip between firefox
alias clip='xclip -sel c'
alias h='history'
alias j='jobs -l'
alias r='rlogin'
alias which='type -all'
alias path='echo -e ${PATH//:/\\n}'
alias print='/usr/bin/lp -o nobanner -d $LPDEST'
# Assumes LPDEST is defined
alias pjet='enscript -h -G -fCourier9 -d $LPDEST'
# Pretty-print using enscript
alias background='xv -root -quit -max -rmode 5'
# Put a picture in the background
alias du='du -kh'
alias dush='du -sh'
alias reload='source ~/.bashrc'
alias wget='wget -c'

function e() {
   TERM=xterm-256color emacsclient -a emacs "$@"
}

function en() {
   TERM=xterm-256color emacsclient -a emacs -n "$@"
}

alias df='df -kTh'
alias ec="TERM=xterm-256color emacsclient"
alias ge='grep -rsn --exclude-dir=.svn --exclude-dir=.cache  --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude=\*.swp --exclude=\*~ --color=auto'
alias grpc='grep -I --exclude-dir=.svn --exclude-dir=.cache  --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude=\*.swp --exclude=\*~ --color=auto --include=*.{c,cpp,h,hpp,cc}' #-I := exclude binary files
# The 'ls' family (this assumes you use the GNU ls)
alias la='ls -Al'               # show hidden files
alias ls='ls --show-control-chars --color=auto -hF'
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lc='ls -lcr'		# sort by change time
alias lu='ls -lur'		# sort by access time
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
	alias lm='ls -al |more'         # pipe through 'more'
function ll()
{ ls -l "$@"| egrep "^d" ; ls -lXB "$@" 2>&-| egrep -v "^d|total "; }
alias tree='tree -Csu'		# nice alternative to 'ls'
alias m='man'
alias mk='make'
alias cm='cmake'
#@see http://stackoverflow.com/questions/3746/whats-in-your-bashrc
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

#gcc
alias objdump='objdump -d -S -hrt'

# tailoring 'less'
#alias more='less'
#export PAGER=less
#export LESSCHARSET='latin1'
#export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
# Use this if lesspipe.sh exists.
#export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
#:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

# spelling typos - highly personnal :-)
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias nospan="sed 's%</*span[^>]*>%%g'"

#----------------
# a few fun ones
#----------------
function xtitle ()
{
	case "$TERM" in
		*term | rxvt)
		echo -n -e "\033]0;$*\007" ;;
		*)
		;;
	esac
}

# aliases...
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'
alias ncftp="xtitle ncFTP ; ncftp"

# .. and functions
function te()  # wrapper around xemacs/gnuserv
{
	if [ "$(gnuclient -batch -eval t 2>&-)" == "t" ]; then
		gnuclient -q "$@";
	else
		( xemacs "$@" &);
	fi
}

#-----------------------------------
# File & strings related functions:
#-----------------------------------

# Find a file with a pattern in name:
function ff()
{ find . -type f -iname '*'$*'*' -ls ; }
# Find a file with pattern $1 in name and Execute $2 on it:
function fe()
{ find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \;  ; }
# find pattern in a set of filesand highlight them:
function fstr()
{
	OPTIND=1
	local case=""
	local usage="fstr: find string in files.
	Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
	while getopts :it opt
	do
		case "$opt" in
			i) case="-i " ;;
			*) echo "$usage"; return;;
		esac
	done
	shift $(( $OPTIND - 1 ))
	if [ "$#" -lt 1 ]; then
		echo "$usage"
		return;
	fi
	local SMSO=$(tput smso)
	local RMSO=$(tput rmso)
	find . -type f -name "${2:-*}" -print0 |
	xargs -0 grep -sn ${case} "$1" 2>&- | \
	sed "s/$1/${SMSO}\0${RMSO}/gI" | more
}

function cuttail() # Cut last n lines in file, 10 by default.
{
	nlines=${2:-10}
	sed -n -e :a -e "1,${nlines}!{P;N;D;};N;ba" $1
}

function lowercase()  # move filenames to lowercase
{
	for file ; do
		filename=${file##*/}
		case "$filename" in
			*/*) dirname==${file%/*} ;;
			*) dirname=.;;
		esac
		nf=$(echo $filename | tr A-Z a-z)
		newname="${dirname}/${nf}"
		if [ "$nf" != "$filename" ]; then
			mv "$file" "$newname"
			echo "lowercase: $file --> $newname"
		else
			echo "lowercase: $file not changed."
		fi
	done
}

function swap()         # swap 2 filenames around
{
	local TMPFILE=tmp.$$
	mv "$1" $TMPFILE
	mv "$2" "$1"
	mv $TMPFILE "$2"
}

# finds directory sizes and lists them for the current directory
dirsize ()
{
    du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
    egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
    egrep '^ *[0-9.]*M' /tmp/list
    egrep '^ *[0-9.]*G' /tmp/list
    rm -rf /tmp/list
}

#-----------------------------------
# Process/system related functions:
#-----------------------------------
function my_ps()
{ ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }

function pp()
{ my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }

# This function is roughly the same as 'killall' on linux
# but has no equivalent (that I know of) on Solaris
function killps()   # kill by process name
{
	local pid pname sig="-TERM"   # default signal
	if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
		echo "Usage: killps [-SIGNAL] pattern"
		return;
	fi
	if [ $# = 2 ]; then sig=$1 ; fi
	for pid in $(my_ps| awk '!/awk/ && $0~pat { print $1 }' pat=${!#} ) ; do
		pname=$(my_ps | awk '$1~var { print $5 }' var=$pid )
		if ask "Kill process $pid <$pname> with signal $sig?"
		then kill $sig $pid
		fi
	done
}

function myip() # get IP adresses
{
  myip=`elinks -dump http://checkip.dyndns.org:8245/`
  echo "${myip}"
}

function ii()   # get current host related info
{
	echo -e "\nYou are logged on ${RED}$HOST"
	echo -e "\nAdditionnal information:$NC " ; uname -a
	echo -e "\n${RED}Users logged on:$NC " ; w -h
	echo -e "\n${RED}Current date :$NC " ; date
	echo -e "\n${RED}Machine stats :$NC " ; uptime
	echo -e "\n${RED}Memory stats :$NC " ; free
	my_ip 2>&- ;
	echo -e "\n${RED}Local IP Address :$NC" ; myip
	echo
}

# Misc utilities:
function repeat()       # repeat n times command
{
	local i max
	max=$1; shift;
	for ((i=1; i <= max ; i++)); do  # --> C-like syntax
		eval "$@";
	done
}

function ask()
{
	echo -n "$@" '[y/n] ' ; read ans
	case "$ans" in
		y*|Y*) return 0 ;;
		*) return 1 ;;
	esac
}

#=======================================================================
#
# PROGRAMMABLE COMPLETION - ONLY SINCE BASH-2.04
# Most are taken from the bash 2.05 documentation and from Ian McDonalds
# 'Bash completion' package
#  (http://www.caliban.org/bash/index.shtml#completion)
# You will in fact need bash-2.05a for some features
#
#=======================================================================
if [ "${BASH_VERSION%.*}" \< "2.05" ]; then
	echo "You will need to upgrade to version 2.05 for programmable completion"
	return
fi

shopt -s extglob        # necessary
set +o nounset          # otherwise some completions will fail

complete -A hostname   rsh rcp telnet rlogin r ftp ping disk
complete -A export     printenv
complete -A variable   export local readonly unset
complete -A enabled    builtin
complete -A alias      alias unalias
complete -A function   function
complete -A user       su mail finger
complete -A helptopic  help     # currently same as builtins
complete -A shopt      shopt
complete -A stopped -P '%' bg
complete -A job -P '%'     fg jobs disown
complete -A directory  mkdir rmdir
complete -A directory   -o default cd

# Compression
complete -f -o default -X '*.+(zip|ZIP)'  zip
complete -f -o default -X '!*.+(zip|ZIP)' unzip
complete -f -o default -X '*.+(z|Z)'      compress
complete -f -o default -X '!*.+(z|Z)'     uncompress
complete -f -o default -X '*.+(gz|GZ)'    gzip
complete -f -o default -X '!*.+(gz|GZ)'   gunzip
complete -f -o default -X '*.+(bz2|BZ2)'  bzip2
complete -f -o default -X '!*.+(bz2|BZ2)' bunzip2
# Postscript,pdf,dvi.....
complete -f -o default -X '!*.ps'  gs ghostview ps2pdf ps2ascii
complete -f -o default -X '!*.dvi' dvips dvipdf xdvi dviselect dvitype
complete -f -o default -X '!*.pdf' acroread pdf2ps zathura
complete -f -o default -X '!*.+(pdf|ps)' gv
complete -f -o default -X '!*.texi*' makeinfo texi2dvi texi2html texi2pdf
complete -f -o default -X '!*.tex' tex latex slitex
complete -f -o default -X '!*.lyx' lyx
complete -f -o default -X '!*.+(htm*|HTM*)' lynx html2ps w3m
# Multimedia
complete -f -o default -X '!*.+(jp*g|gif|xpm|png|bmp)' xv gimp
complete -f -o default -X '!*.+(mp3|MP3)' mpg123 mpg321
complete -f -o default -X '!*.+(ogg|OGG)' ogg123
complete -f -o default -X '!*.pl'  perl perl5

# This is a 'universal' completion function - it works when commands have
# a so-called 'long options' mode , ie: 'ls --all' instead of 'ls -a'

_get_longopts ()
{
	$1 --help | sed  -e '/--/!d' -e 's/.*--\([^[:space:].,]*\).*/--\1/'| \
	grep ^"$2" |sort -u ;
}

_longopts_func ()
{
	case "${2:-*}" in
		-*)	;;
		*)	return ;;
	esac

	case "$1" in
		\~*)	 eval cmd="$1" ;;
		*)	 cmd="$1" ;;
	esac
	COMPREPLY=( $(_get_longopts ${1} ${2} ) )
}
complete  -o default -F _longopts_func configure bash
complete  -o default -F _longopts_func wget id info a2ps ls recode

_make_targets ()
{
	local mdef makef gcmd cur prev i

	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	prev=${COMP_WORDS[COMP_CWORD-1]}

	# if prev argument is -f, return possible filename completions.
	# we could be a little smarter here and return matches against
	# `makefile Makefile *.mk', whatever exists
	case "$prev" in
		-*f)    COMPREPLY=( $(compgen -f $cur ) ); return 0;;
	esac

	# if we want an option, return the possible posix options
	case "$cur" in
		-)      COMPREPLY=(-e -f -i -k -n -p -q -r -S -s -t); return 0;;
	esac

	# make reads `makefile' before `Makefile'
	if [ -f makefile ]; then
		mdef=makefile
	elif [ -f Makefile ]; then
		mdef=Makefile
	else
		mdef=*.mk               # local convention
	fi

	# before we scan for targets, see if a makefile name was specified
	# with -f
	for (( i=0; i < ${#COMP_WORDS[@]}; i++ )); do
		if [[ ${COMP_WORDS[i]} == -*f ]]; then
			eval makef=${COMP_WORDS[i+1]}      # eval for tilde expansion
			break
		fi
	done

	[ -z "$makef" ] && makef=$mdef

	# if we have a partial word to complete, restrict completions to
	# matches of that word
	if [ -n "$2" ]; then gcmd='grep "^$2"' ; else gcmd=cat ; fi

	# if we don't want to use *.mk, we can take out the cat and use
	# test -f $makef and input redirection
	COMPREPLY=( $(cat $makef 2>/dev/null | \
	awk 'BEGIN {FS=":"} /^[^.#   ][^=]*:/ {print $1}' \
	| tr -s ' ' '\012' | sort -u | eval $gcmd ) )
}

complete -F _make_targets -X '+($*|*.[cho])' make gmake pmake

# cvs(1) completion
_cvs ()
{
	local cur prev
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	prev=${COMP_WORDS[COMP_CWORD-1]}

	if [ $COMP_CWORD -eq 1 ] || [ "${prev:0:1}" = "-" ]; then
		COMPREPLY=( $( compgen -W 'add admin checkout commit diff \
		export history import log rdiff release remove rtag status \
		tag update' $cur ))
	else
		COMPREPLY=( $( compgen -f $cur ))
	fi
	return 0
}
complete -F _cvs cvs

_killall ()
{
	local cur prev
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}

	# get a list of processes (the first sed evaluation
	# takes care of swapped out processes, the second
	# takes care of getting the basename of the process)
	COMPREPLY=( $( /usr/bin/ps -u $USER -o comm  | \
	sed -e '1,1d' -e 's#[]\[]##g' -e 's#^.*/##'| \
	awk '{if ($0 ~ /^'$cur'/) print $0}' ))

	return 0
}

complete -F _killall killall killps

# A meta-command completion function for commands like sudo(8), which
# need to first complete on a command,
# then complete according to that command's own
# completion definition - currently not quite foolproof
# (e.g. mount and umount don't work properly),
# but still quite useful --
# By Ian McDonald, modified by me.
_my_command()
{
	local cur func cline cspec

	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}

	if [ $COMP_CWORD = 1 ]; then
		COMPREPLY=( $( compgen -c $cur ) )
	elif complete -p ${COMP_WORDS[1]} &>/dev/null; then
		cspec=$( complete -p ${COMP_WORDS[1]} )
		if [ "${cspec%%-F *}" != "${cspec}" ]; then
			# complete -F <function>
			#
			# COMP_CWORD and COMP_WORDS() are not read-only,
			# so we can set them before handing off to regular
			# completion routine

			# set current token number to 1 less than now
			COMP_CWORD=$(( $COMP_CWORD - 1 ))
			# get function name
			func=${cspec#*-F }
			func=${func%% *}
			# get current command line minus initial command
			cline="${COMP_LINE#$1 }"
			# split current command line tokens into array
			COMP_WORDS=( $cline )
			$func $cline
		elif [ "${cspec#*-[abcdefgjkvu]}" != "" ]; then
			# complete -[abcdefgjkvu]
			#func=$( echo $cspec | sed -e 's/^.*\(-[abcdefgjkvu]\).*$/\1/' )
			func=$( echo $cspec | sed -e 's/^complete//' -e 's/[^ ]*$//' )
			COMPREPLY=( $( eval compgen $func $cur ) )
		elif [ "${cspec#*-A}" != "$cspec" ]; then
			# complete -A <type>
			func=${cspec#*-A }
			func=${func%% *}
			COMPREPLY=( $( compgen -A $func $cur ) )
		fi
	else
		COMPREPLY=( $( compgen -f $cur ) )
	fi
}

#mkdir, cd into it
mkcd () {
  mkdir -p "$*"
  cd "$*"
}

complete -o default -F _my_command nohup exec eval \
  trace truss strace sotruss gdb
complete -o default -F _my_command command type which man nice

function pclip() { xclip -selection c $@; }
function gclip() { xclip -o $@; }

#@see https://github.com/dattanchu/pymodoro
alias v=vim
alias vd=vimdiff
