# --- Exports --- 

export PATH=~/.bash_me/lib/scripts:$PATH

# --- Functions --- 

#mvp starter
np () {
    code
    mcd $1
    touch index.js
    e
}

# go to directory and ll inside it 
cl () {
    clear
    if [ -z "$1" ]; then
        cd ..
    else
        cd $1
    fi
    ls
}

# Makes directory and goes to it
mcd () {
 mkdir $1
 cd $1
}

# opens the index file of a directory in vim
e () {

    for f in ./index.*; do
        vim $f
        break
    done

}




g () {


    options=("*BUG-FIX*" "*REFACTORING*" "*CONFIG*" "*FEATURE*" "*MIGRATION*" "*DOC*")
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

test () {
    PS2="$PS2 test"
}

# add and list tasks
t () {

    if [ ! -f ~/.todo ]; then
        touch ~/.todo
    fi

    if [ ! -z "$1" ]; then
        echo "- $1" >> ~/.todo
    else 
        while read -r p; do
            echo -e "$p"
        done <~/.todo
    fi
}

# removes tasks
tt () {


    if [ ! -f ~/.todo ]; then
        touch ~/.todo
    fi

    oldIFS="$IFS"
    IFS='
    '
    IFS=${IFS:0:1}
    options=('exit')
    options+=($(cat ~/.todo | grep -v "e\[0m"))
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

# Tools

alias meteor="cmd //c meteor"

# Util

alias r='. ~/.bashrc'
alias ls='ll -tarh'
alias lg='ls | grep'

alias bm='cd ~/.bash_me'
alias bma='cd ~/.bash_me/lib/aliases'
alias bms='cd ~/.bash_me/lib/scripts'


# Navigation

alias code='cd ~/code'
alias idea='cd ~/idea'


# Edit

alias imv='vim'
alias vmi='vim'
alias ivm='vim'
alias vb='vim ~/.bashrc && r'
alias vv='vim ~/.vimrc'
alias vt='vim ~/.todo'
alias vx='vim ~/.tmux.conf '
alias vii='vim ~/.inputrc && bind -f ~/.inputrc'
alias vbab='vim ~/.bash_me/lib/aliases/bashme.sh'
alias vbag='vim ~/.bash_me/lib/aliases/git.sh'

# Git

alias b='git checkout Beta && git pull origin Beta'
alias p='git checkout Prod && git pull origin Prod'
alias add='git add -p'
alias com='git commit -m'
alias go='git checkout'
__git_complete go _git_checkout
alias gpl='git pull origin HEAD'
alias gph='git push origin HEAD'
alias gm='git merge'
__git_complete gm _git_merge
alias gf='git fetch'
alias gs='git stash'
alias gsp='git stash pop'
alias gcn='git commit -n'
alias gcb='git checkout -b'
__git_complete gcb _git_checkout
alias gb='git branch'


# Vagrant

alias halt='vagrant halt'
alias up='vagrant up'
alias vsh='vagrant ssh'
alias destroy='vagrant destroy -y'
alias hh='halt && hs'


# Laravel

alias am='php artisan migrate'
alias ci='composer install'
alias ac='php aritsan cache:clear && php artisan route:clear && composer dump-autoload'

