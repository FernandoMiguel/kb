export PATH=/usr/local/opt/curl/bin:/usr/local/opt/openssl@1.1/bin:/usr/local/sbin:/usr/local/bin:/usr/local/opt:/Users/fernando/go/bin:$PATH

complete -C aws_completer aws

if [ -f "$(brew --prefix)"/etc/bash_completion ]; then
. "$(brew --prefix)"/etc/bash_completion
fi

alias code='code-insiders'
alias nas='ssh nas.fernandomiguel.net -p 4444 -l root'
alias byte='ssh -l fernandomiguel plex.imperialus.house'
alias brewall='brew -v update && brew -v upgrade && brew cask upgrade --greedy && brew cu --all'
alias brewcleanup='brew cleanup && brew cu --cleanup'
alias dockerupdateallimages='docker images --format "{{.Repository}}:{{.Tag}}" | xargs -L1 docker pull'
alias chrome-dns='open /Applications/Google\ Chrome.app --args --disable-async-dns'
alias chromeram='diskutil erasevolume HFS+ '"'RAMDisk'"' `hdiutil attach -nomount ram://262144` &&  open -a "Google Chrome Canary" --args --no-first-run --disable-async-dns -disk-cache-dir=$(mktemp -d /Volumes/RAMDisk/chromecanary.XXXXXX) --user-data-dir=$(mktemp -d /Volumes/RAMDisk/chromecanary.XXXXXX)'
alias setdns='networksetup -setdnsservers Wi-Fi 127.0.0.1'
alias setdnsall='networksetup -setdnsservers Wi-Fi 127.0.0.1 2a07:a8c0::96:f736 2a07:a8c1::96:f736 2606:4700:4700::1001 2606:4700:4700::1111 2620:0:ccd::2 2620:0:ccc::2 2001:4860:4860::8844 2001:4860:4860::8888 2620:fe::fe 2620:fe::9 1.0.0.1 1.1.1.1 208.67.220.220 208.67.222.222 8.8.4.4 8.8.8.8 149.112.112.112 9.9.9.9 176.103.130.131 176.103.130.130'
alias getdns="networksetup -getdnsservers Wi-Fi && scutil --dns"
alias dockertty='screen ${HOME}/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty'
alias awswhoami='aws sts get-caller-identity'
alias awslogin='aws-vault --debug login --federation-token-ttl=8h --assume-role-ttl=1h --stdout --no-session $p | xargs -t /Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --args --no-first-run --disable-async-dns --new-window -disk-cache-dir=$(mktemp -d /tmp/chromecanary.XXXXXX) --user-data-dir=$(mktemp -d /tmp/chromecanary.XXXXXX)'
alias sshconverter='ssh-keygen -y -f '
alias fuckmeraki='sudo profiles -R -p com.meraki.sm.629378047925028072'
alias namebench-config='namebench --runs=3 --health_threads=2 --benchmark_threads=10 --ping_timeout=10 --input=chrome --invalidate_cache --query_count=100 --select_mode=chunk --open_webbrowser --enable-censorship-checks --only 127.0.0.1 2a0d:2406:1801::9f:19b8 2a0d:2406:1802::96:f736 2a00:5a60::ad2:0ff 2a00:5a60::ad1:0ff 2606:4700:4700::1001 2606:4700:4700::1111 2620:0:ccd::2 2620:0:ccc::2 2001:4860:4860::8844 2001:4860:4860::8888 2620:fe::fe 2620:fe::9 5.182.208.230 1.0.0.1 1.1.1.1 176.103.130.131 176.103.130.130 208.67.220.220 208.67.222.222 8.8.4.4 8.8.8.8 149.112.112.112 9.9.9.9'
alias terragrunt-cleanup='find ~/work/ -type d -name ".terragrunt-cache" -prune -exec rm -rfv {} \;'
alias terraform-cleanup='find ~/work/ -type d -name ".terraform" -prune -exec rm -rfv {} \;'
alias gitfetchall='find ~/work/ -name .git -print -execdir git fetch --progress --all --no-tags --prune --prune-tags --verbose --jobs=200 \;'
alias gitpullall='find ~/work/ -name .git -print -execdir git pull --ff-only --stat --progress --all --no-tags \;'

alias ls='ls -h'
alias ll="ls -lah"
alias lm='ll |more'        #  Pipe through 'more'
#alias lr='ll -lvrta'
alias la='ls -lahtr'       #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

# export HOMEBREW_GITHUB_API_TOKEN=XX
export DOCKER_BUILDKIT=1
export BASH_SILENCE_DEPRECATION_WARNING=1

# Added by Krypton
export GPG_TTY=$(tty)
