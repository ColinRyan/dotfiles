
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"



_testing()
{
    COMPREPLY=($(find ~/code/testing/ -mindepth 1 -type d -printf "%f\n"))
}

_why()
{
    COMPREPLY=($(find ~/code/why/ -type f -printf "%f\n"))
}

__has_parent_dir () {
    # Utility function so we can test for things like .git/.hg without firing up a
    # separate process
    test -d "$1" && return 0;

    current="."
    while [ ! "$current" -ef "$current/.." ]; do
        if [ -d "$current/$1" ]; then
            return 0;
        fi
        current="$current/..";
    done

    return 1;
}

__vcs_name() {
    if [ -d .svn ]; then
        echo "- [svn]";
    elif __has_parent_dir ".git"; then
        echo "- [$(__git_ps1 'git %s')]";
    elif __has_parent_dir ".hg"; then
        echo "- [hg $(hg branch)]"
    fi
}

black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

# Nicely formatted terminal prompt
export PS1='\n\[$bold\]\[$black\][\[$dk_blue\]\@\[$black\]]-[\[$green\]\u\[$yellow\]@\[$green\]\h\[$black\]]-[\[$pink\]\w\[$black\]]\[\033[0;33m\]$(__vcs_name) \[\033[00m\]\[$reset\]\n\[$reset\]\$ '
export GNOME_KEYRING_CONTROL=1

# --- Source ---
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh
source ~/.bash_aliases
# --- Exports --- 

export PATH=~/.yarn/bin:$HOME/.gem/ruby/2.5.0/bin:/root/.gem/ruby/2.5.0/bin:$HOME/.config/composer/vendor/bin:/usr/lib/node_modules:$HOME/.local/bin:$PATH
export TERM="screen-256color"

# --- Functions --- 

# funcs

# takes a alias name and gets the last command from the history. Makes it an alias
makeAlias() 
{
if [ $# -eq 0 ]
  then
    echo "No arguments supplied. You need to pass an alias name"
else 
cat  <<EOF >> ~/.bash_aliases
alias $1="$(history | tail -n 2 | cut -c 8- | sed -e '$ d')"
EOF

echo $out
r
fi 
} 

npt() 
{
    code
    mcd
} 

csvIdFieldNull () {

    perl -pe 's/^.+?,/null,/' $2 >> $1
}

# makes an sh file ($2.sh) from $1 number of commands in the history
makeCommand () {

cat  <<EOF > ./$2.sh
#! /usr/bin/env bash
$(history | tail -n $(($1 + 1)) | cut -c 8- | sed -e '$ d')
EOF

echo $out
chmod +x ./$2.sh
}

query () {

    opn "https://www.google.com/q?"
}
testing () {
    mkdir -p ~/code/testing/$1
    tmux new-window 
    tmux split-window nvim ~/code/testing/$1/$2.$1
}

why () {
    mkdir -p ~/code/why/$1
    nvim ~/code/why/$1/$1
}
#unzip
uz () {
    file=$(ls -f *.zip | fzf -1 -0)
    dir=$(basename $file .zip)

    mkdir $dir
    cp $file $dir
    cd $dir 
    unzip $file

}

mdiff(){
   git branch --list -a --merged "$1" | sed 's/^..//;s/ .*//' | xargs git branch --list -a --no-merged "$2"
}

# portage use dir if on gentoo

use () {

 case `uname -r` in 
     ?*gentoo) cd /etc/portage/package.use;;
 esac
}


kw () {

 case `uname -r` in 
     ?*gentoo) cd /etc/portage/package.keywords;;
 esac
}

# mother fucking curry bitch
# https://gist.github.com/abesto/4286574
function curry () {
    exportfun=$1; shift
    fun=$1; shift
    params=$*
    cmd=$"function $exportfun() {
        more_params=\$*;
        $fun $params \$more_params;
    }"
    eval $cmd
}     

#mvp starter
mvp () {
    code
    mcd $1
    touch index.$2
    touch readme.md
    git init
    e
}

# go to directory and ll inside it 
cl () {
    clear
    if [ -z "$1" ]; then
        builtin cd ..
    else
        builtin cd $1
    fi
    ls
}

findBuggedCommit () {
    
   commits=($(git log --pretty=%h -n 50))
   change=10

   echo commits
   index=0

   until [ $change -eq 0 ]; do
       read -p "Up or Down?" -n 1 -r
       echo

       if [[ $REPLY  =~ ^[j]$ ]]; then
           echo ${commits[$((index+change))]}
           index=$((index+change))
           echo $((index+change))
       fi
       if [[ $REPLY =~ ^[k]$ ]]; then
           echo ${commits[$((index-change))]}
           index=$((index-change))
           echo $((index-change))
       fi
   done
}
# Go to branch and run npm run dev
gotobranch () {
 git checkout $1
}


# Makes directory and goes to it
mcd () {
 mkdir $1
 cd $1
}

# opens the index file of a directory in vim
e () {

    for f in ./index.*; do
        nvim $f
        break
    done

}


ff () {
  grep -rnw "$1" -e "$2"
}

g () {


    options=("*BUG-FIX*" "*REFACTORING*" "*CONFIG*" "*FEATURE*" "*MIGRATION*" "*DOC*" "*BUILD*" "*UTIL*" "*INFRASTRUCTURE*" "*STYLE*")
    git add -p


    PS3='Select a commit tag:'
    select opt in "${options[@]}"
    do 
        case $opt in
            *) tag=$opt; break;;
        esac
    done

    read -p 'Create a commit message:' msg

    git commit -m "$tag:$msg"
        
    
}

g2 () {

    diff=$(git diff --exit-code)
    echo $diff
    if [ ! -z "$1" ] && [ -e "$1" ]; then
        echo "test$diff lala"
    fi
}

# 1) Pick a branch ($1)
# 2) stash 
# 3) checkout
# 4) updated files from last commit
# 5) commit and push if new edits made
# 6) back to previous branch
# 7) pop stashk
g3 () {
   
    cd $(git rev-parse --show-toplevel)

    echo "" > ~/.g3old
    echo "" > ~/.g3new

    oldStashCount=$(git stash list | wc -l)
    if [ ! -z "$1" ]; then
        git stash
        git checkout $1
    fi

    oldIFS="$IFS"
    IFS='
    '
    IFS=${IFS:0:1}
    options=('done')
    options+=($(git diff --name-only HEAD~1 HEAD))
    IFS="$oldIFS"

    echo ""

    PS3='Select a file to edit:'
    select opt in "${options[@]}"
    do
        case $opt in
            'done') break;;
            *) md5sum $opt >>~/.g3old;vim $opt;md5sum $opt >> ~/.g3new;
        esac
    done

    echo "" 

    old=$(md5sum ~/.g3old | cut -d" " -f1) 
    new=$(md5sum ~/.g3new | cut -d" " -f1)  
    echo $old
    echo $new
    if [ "$old" != "$new" ] ; then
 
        git add -u

        options=("*BUG-FIX*" "*REFACTORING*" "*CONFIG*" "*FEATURE*")


        PS3='Select a commit tag:'
        select opt in "${options[@]}"
        do 
            case $opt in
                *) tag=$opt; break;;
            esac
        done

        read -p 'Create a commit message:' msg

        git commit -m "$tag:$msg"

        git push origin HEAD
    fi

    git checkout -

    newStashCount=$(git status list | wc -l)

    if [ $newStashCount -gt $oldStashCount ]; then
        git stash pop
    fi
    
    cd -

}
__git_complete g3 _git_checkout

ca () {
    current_branch=`git rev-parse --abbrev-ref HEAD`

    git show-branch -a | ack '\*' | ack -v "$current_branch" | head -n1 | 
    sed 's/.*\[\(.*\)\].*/\1/' | sed 's/[\^~].*//'
}

# add and list tasks
t () {

    if [ ! -f ~/.todo ]; then
        touch ~/.todo
    fi

    if [ ! -f ./.todo ]; then
        todo='./.todo'
    else 
        todo='~/.todo'
    fi

    if [ ! -z "$1" ]; then
        echo "- $1" >> $todo
    else 
        while read -r p; do
            echo -e "$p"
        done <$todo
    fi
}

# removes tasks
tt () {


    if [ ! -f ~/.todo ]; then
        touch ~/.todo
    fi

    if [ ! -f ./.todo ]; then
        todo='./.todo'
    else 
        todo='~/.todo'
    fi

    oldIFS="$IFS"
    IFS='
    '
    IFS=${IFS:0:1}
    options=('exit')
    options+=($(cat $todo | grep -v "e\[0m"))
    IFS="$oldIFS"


    PS3='Select a task to complete:'
    select opt in "${options[@]}"
    do
        case $opt in
            exit) break;;
            *) sed -i "s/$opt/- \\\\e[9m$opt\\\\e[0m/" ~/.todo; break;; 
        esac
    done

}
# --- Alias ---

# Util

alias r='. ~/.bashrc'
alias ls='ls -la'
alias lg='ls | grep'
alias i='sudo pacman -S'
alias y='yaourt -S'

alias cd='cl'
alias bm='cd ~/.bash_me'
alias bma='cd ~/.bash_me/lib/aliases'
alias bms='cd ~/.bash_me/lib/scripts'
alias cr='composer require'
alias ni='npm install'
alias nrd='npm run dev'
alias killw="ps -aux | grep mysql-workbench-bin | grep -v grep | tr -s ' ' | cut -d ' ' -f 2 | xargs kill"
alias dl="cd ~/Downloads"
alias ts="testing"
complete -F _testing ts
alias tmux="tmux -2"
alias ..="cd .."
alias uv="cd ~/.vim/bundle && find ./ -maxdepth 1 -type d | xargs -I x bash -c 'cd x; git fetch; git pull; cd -'"
alias c="clear"

# Navigation

alias code='cd ~/code'
alias why='why'
complete -F _why why
alias idea='cd ~/idea'

alias pma='cd ~/projects/patientme/core/api'
alias pmw='cd ~/projects/patientme/core/webapp'
alias pmn='cd ~/projects/patientme/core/native'
alias pmc='cd ~/projects/patientme/core/client-web'

# Laravel

alias pa='php artisan'

# Edit

alias vim='nvim'
alias imv='nvim'
alias vmi='nvim'
alias ivm='nvim'
alias nivm='nvim'
alias nvi='nvim'
alias nvmi='nvim'
alias vb='vim ~/.bashrc && r'
alias vg='vim ~/.gitconfig'
alias vv='vim ~/.config/nvim/init.vim'
alias vt='vim ~/.todo'
alias vx='vim ~/.tmux.conf '
alias v3='vim ~/.config/i3/config'
alias vii='vim ~/.inputrc && bind -f ~/.inputrc'
alias vbab='vim ~/.bash_me/lib/aliases/bashme.sh'
alias vbag='vim ~/.bash_me/lib/aliases/git.sh'
alias vc='vim ~/.config/composer/composer.json'

# Git

alias gB='git checkout Beta && git fetch && git pull origin Beta && npm run dev'
alias gP='git checkout Prod && git fetch && git pull origin Prod && npm run dev'
alias gR='git checkout release && git fetch && git pull origin release'
alias p='git push origin HEAD'
alias add='git add -p'
alias com='git commit -m'
alias go='gotobranch'
__git_complete go _git_checkout
alias gpl='git pull origin HEAD'
alias gph='git push origin HEAD'
alias gm='git merge'
alias gr='git rebase'
alias grc='git rebase --continue'
alias gmo='git merge origin/'
__git_complete gm _git_merge
__git_complete gr _git_rebase
__git_complete gmo _git_merge
alias gf='git fetch'
alias gs='git stash'
alias gsp='git stash pop'
alias gcn='git commit -n'
alias gcb='git checkout -b'
__git_complete gcb _git_checkout
alias gb='git branch'
alias gl='git log'
alias gc='git commit'
alias grh='git revert --hard'
alias gx="git for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' refs/heads/ | fzf | xargs -I branch git checkout branch && npm run dev "


# Vagrant

alias halt='vagrant halt'
alias up='vagrant up'
alias vsh='vagrant ssh'
alias destroy='vagrant destroy -y'
alias hh='halt && hs'


# Laravel

alias am='php artisan migrate'
alias ci='composer install'
alias ac='php artisan cache:clear && php aritsan route:clear && composer dump-autoload'

alias sound='alsamixer'
alias mn='xrandr --output HDMI-1 --right-of eDP-1 --auto'
alias mf='xrandr --output HDMI-1 --auto'
alias tv='xrandr --output HDMI-1 --mode 1600x1200'
alias sx='startx'
alias vi3='vim ~/.config/i3/config'
# source /usr/share/nvm/init-nvm.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
