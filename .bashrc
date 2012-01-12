export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias ll="pwd; ls -lhaG"
alias lll="ll | less"

export GIT_EDITOR="gvim -f"

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias scmtree="find . -print | grep -v "\.svn" | grep -v "\.git" | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias svnext="svn pg svn:externals"

color_tail() {
    tail -100f $1 | perl -ple 's/^.*SEVERE.*$/\e[1;37;45m$&\e[0m/ || s/^.*ERROR.*$/\e[1;37;41m$&\e[0m/ || s/^.*WARN.*$/\e[1;33;40m$&\e[0m/'
}

# Mac specific
alias qlf='qlmanage -p "$@" >& /dev/null'
