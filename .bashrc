bind -r '\C-s'
stty -ixon

 shopt -s histappend
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Initialize variables for completion


# Helper function to split the command line into words


_agi3() {
    local cur prev 

    local cur=${COMP_WORDS[COMP_CWORD]}
    local prev=${COMP_WORDS[COMP_CWORD-1]}


    local commands="gen generate e2e add_config checkout docker_up docker_stop check_environment init_environment clean_environment build_system purge_system configure_aws_cli generate_source_bundle generate_source_bundle_gh docker_pull_local docker_login build_and_push_local_images build_and_push_dev_images build_and_push_prod_images docker_pull_prod docker_login_production deploy_prod deploy_stage deploy_test deploy_dev rebuild_all rebuild_all_and_load_data purge_and_rebuild_all rebuild_for_reinit install_frontend reset_frontend push_init_tables load_stock_dataset export_legacy_init_tables restore_init_tables restore_cadastral restore_mgrs backup_db restore_db restore_complete_backup run_coverage run_backend_tests run_frontend_tests run_precommit run_linters build_pdm build_apidocs generate_pdm django_shell django_pytest cut_release deploy_hotfix bump_version release_start release_finish hotfix_start hotfix_finish"

    local e2e_opts="generate run install"
    local gen_opts="component page install"

    case "$prev" in
        gen)
            COMPREPLY=($(compgen -W "$gen_opts" -- $cur))

            return
            ;;

        generate)
            COMPREPLY=($(compgen -W "$gen_opts" -- $cur))

            return
            ;;

        e2e)
            COMPREPLY=($(compgen -W "$e2e_opts" -- $cur))

            return
            ;;
        *)
            COMPREPLY=($(compgen -W "$commands" -- $cur))
            ;;
    esac
}


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
        echo "$black-[$yellow$(__git_ps1 'git %s')$black]";
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


# --- Source ---
source ~/.bin/tmuxinator.bash
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh
source ~/.bash_functions
source ~/.bash_aliases
# --- Exports --- 

export SYSTEMD_EDITOR=nvim
export PATH=$HOME/.gem/ruby/2.7.0/bin:$HOME/.gem/ruby/3.3.0/bin:$HOME/.config/composer/vendor/bin:/usr/lib/node_modules:$HOME/.local/bin:$PATH:$HOME/.perl6/bin:$HOME/.bin
export PATH="$HOME/Apps:$HOME/.slack/bin:$(go env GOPATH)/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.luarocks/bin:$PATH"
export TERM="xterm-256color"
export CAPACITOR_ANDROID_STUDIO_PATH="/usr/bin/android-studio"


# Nicely formatted terminal prompt
export NODE_ENV=development
export EDITOR=nvim
export HISTCONTROL=ignoredups:erasedups 
export PS1='\n\[$bold\]\[$black\][\[$dk_blue\]\@\[$black\]]-[\[$green\]\u\[$yellow\]@\[$green\]\h\[$black\]]-[\[$pink\]\w\[$black\]]\[\033[033m\]$(__vcs_name) \[\033[00m\]\[$reset\]\n\[$reset\]\$ '
export GNOME_KEYRING_CONTROL=1
export ANDROID_SDK=/opt/android-sdk


# --- Functions --- 

# Funcs


selectProject() 
{
    directory=$(find ~/projects/ -maxdepth 1 -type d | grep -P "[\w\-]+$" -o | fzf)

    [[ ! -z "$directory" ]] && echo $directory > ~/.config/.project && mux start project $directory

} 

startDeployment() {


	if [[ -f artisan ]]; then
		echo "N/A"
	elif [[ -f package.json ]]; then

		echo "N/A"
	elif [[ -f serverless.yml ]]; then
		serverless deploy --aws-profile serverless
		# elif [[ -f figwheel-main.edn ]]; then
		# lein fig:test
	fi

}

startTesting() 
{
    if [[ -f artisan ]]; then
        ./vendor/bin/phpunit
    elif [[ -f package.json ]]; then
        yarn test

    elif [[ -f serverless.yml ]]; then
	serverless invoke local --function
    # elif [[ -f figwheel-main.edn ]]; then
	# lein fig:test
    fi

} 


startEditing() 
{
    dir=$(basename "$PWD")
    dir=${dir//-/_}
    if [ -f 'Session.vim' ]; then 
	    nvim -S Session.vim; 
    elif [ -f 'App.js' ]; then 
        nvim 'App.js'; 
    elif [ -f 'App.tsx' ]; then 
        nvim 'App.tsx'; 
    elif [ -f 'index.js' ]; then 
        nvim 'index.js'; 
    elif [ -f 'index.tsx' ]; then 
        nvim 'index.tsx'; 
    elif [ -f 'src/App.js' ]; then
        nvim 'src/App.js'
    elif [ -f 'src/index.js' ]; then
        nvim 'src/index.js'
    elif [ -f 'src/index.tsx' ]; then
        nvim 'index.tsx'; 
    elif [ -f 'src/App.js' ]; then
        nvim 'src/App.js'
    elif [ -f 'src/index.js' ]; then
        nvim 'src/index.js'
    elif [ -f 'src/index.tsx' ]; then
        nvim 'src/index.tsx'
    elif [ -f 'src/App.tsx' ]; then
        nvim 'src/App.tsx'
    elif [ -f 'generators/app/index.js' ]; then
        nvim 'generators/app/index.js'
    elif [ -f "src/$dir/core.cljs" ]; then
	nvim "src/$dir/core.cljs"
    elif [ -f "handler.js" ]; then
	nvim "handler.js"
    elif [ -f "src/main/clojurescript/serverless/functions.cljs" ]; then
	nvim "src/main/clojurescript/serverless/functions.cljs"
    elif [ -f ".next.config.js" ]; then
	nvim "pages/index.tsx"

    elif [ -f "mange.py" ]; then
	nvim "mange.py"
    else 
        nvim; 
    fi
} 

startServing() 

{
    if [[ -f artisan ]]; then
        php artisan serve
    elif [[ -f bun.lockb ]]; then
        bun run dev
    elif [[ -f docker-compose.yml ]]; then
        COMPOSE_BAKE=true docker compose up --build
    elif [[ -f local.yml ]]; then
        COMPOSE_BAKE=true docker compose -f local.yml  -f docker-compose.override.yml up --build
    elif [[ -f ./deploy/apps/agi3.local.yml ]]; then
        nvm use 16.14.2
        COMPOSE_BAKE=true docker compose -f ./deploy/apps/agi3.local.yml up $1
    elif [[ -f next.config.js ]]; then
        npm run dev
    elif [[ -f shadow-cljs.edn ]]; then
        npx shadow-cljs watch app
    elif [[ -f package.json ]]; then
        npm start
    elif [[ -f figwheel-main.edn ]]; then
	    lein fig:build
    elif [[ -f manage.py ]]; then
	    python manage.py runserver

    elif [[ -f blitz.config.js ]]; then
        blitz dev
    elif grep -q 'fennel-love2d' ".projectrc"; then
        love .
    fi
}


mvp() 
{

   clear
   read -p "Enter new project name: " projectName

   if [ -z ${projectName//} ]; then
       echo "No project name given"
       return
   fi 

   types=('fennel-nvim-plugin'  'blitz.js vanilla' 'fennel-love2d' 'serverless' 'django' 'chrome-extension' 'generator' 'react-native-js' 'elm-pages' 'parcel-elm' 'react-web-js'
   'clojure-reagent-frontend' 'react-native-clojure' 'parcel-js-vanilla'
   'laravel' 'nodejs' 'cli-js' 'esbuild-ts-vanilla' 'electron-react' 'bun-vite-vanilla-ts' 'bun-vite-react-swc-ts')
   echo "Select a project type"
   projectType=$(IFS=$'\n'; echo "${types[*]}" | fzf -m )

   if [ -z ${projectType//} ]; then
       echo "No project type selected."
       return
   fi 

   cd ~/projects/
   if [[ $projectType = "generator" ]]; then
       nvm use 11.6
       yo generator


   elif [[ $projectType = "react-amplify" ]]; then
       nvm use 11.6
       yarn create react-app $projectName --typescript
       amplify init
       yarn add aws-amplify aws-amplify-react ramda partial.lenses flutures date-fns @material-ui/core


   elif [[ $projectType = "serverless" ]]; then
	   nvm use 11.6
	   serverless create --template aws-nodejs --path $projectName --name $projectName




   elif [[ $projectType = "elm-pages" ]]; then
       nvm use 17.9
       elm-pages init $projectName
       cd $projectName
       npm install
       cd -


   elif [[ $projectType = "parcel-elm" ]]; then
       nvm use 17.9
       elm-app-gen $projectName


   elif [[ $projectType = "parcel-js-vanilla" ]]; then
       nvm use 11.6
       mcd $projectName
       yo parcel-js-vanilla
       cd -


   elif [[ $projectType = "react-native-js" ]]; then
       nvm use 11.6
       yarn create react-native-app $projectName



   elif [[ $projectType = "chrome-extension" ]]; then
       nvm use 11.6
       mcd $projectName
       yo chrome-extension
       cd -


   elif [[ $projectType = "laravel" ]]; then
       laravel new $projectName




   elif [[ $projectType = "nodejs" ]]; then
       //


   elif [[ $projectType = "cli-js" ]]; then
       //


   elif [[ $projectType = "react-native-clojure" ]]; then
       lein new expo $projectName
       cd $projectName && yarn install
       lein figwheel
       cd ..


   elif [[ $projectType = "clojure-reagent-frontend" ]]; then
       lein new shadow-cljs $projectName +reagent
       npm install



   elif [[ $projectType = "django" ]]; then
	   django-admin startproject $projectName



   elif [[ $projectType = "fennel-love2d" ]]; then
       mcd $projectName
       git clone https://gitlab.com/alexjgriffith/min-love2d-fennel.git .
       rm -rf .git
       touch .projectrc
       echo "fennel-love2d" >> .projectrc
       cd - 



   elif [[ $projectType = "blitz.js vanilla" ]]; then
       blitz new $projectName
       cd $projectName



   elif [[ $projectType = "electron-react" ]]; then
       npm init electron-app@latest $projectName -- --template=webpack-typescript
       cd $projectName
       npm install react react-dem
       npm install --save-dev @types/react @types/react-dom
       npm install --save-dev @babel/core @babel/preset-react babel-loader
       npm install baseui styletron-react styletron-engine-monolithic





   elif [[ $projectType = "fennel-nvim-plugin" ]]; then
       mcd $projectName
       rm -rf .git
       curl -fL https://raw.githubusercontent.com/Olical/aniseed/master/scripts/seed.sh | sh
       ln -s $HOME/project/$projectName $HOME/.local/share/nvimplugged/$projectName 
       cd - 


   elif [[ $projectType = "esbuild-ts-vanilla" ]]; then
       mcd $projectName
       git clone git@github.com:ColinRyan/esbuild-starter.git .
       rm -rf .git
       npm ci
       cd - 




   elif [[ $projectType = "bun-vite-vanilla-ts" ]]; then
       bunx create-vite $projectName --template vanilla-ts
       mcd $projectName
       bun install
       cd - 


   elif [[ $projectType = "bun-vite-react-swc-ts" ]]; then
       nvm use 21
       bunx create-vite $projectName --template react-swc-ts
       mcd $projectName
       bun install
       cd - 
   else 
       echo "No project type selected."
       return
   fi



   #
   #
   #
   mcd $projectName
   git init
   touch "Readme.md"

   echo $projectName > ~/.config/.project 
   mux start project $projectName
   #

   return 1
} 

# takes a alias name and gets the last command from the history. Makes it an
# alias and puts it in .bash_aliases.
makeAlias() 
{
if [ $# -eq 0 ]; then
    echo "No arguments supplied. You need to pass an alias name"
else 
   newAlias=$(history | tail -n 2 | cut -c 8- | sed -e '$ d')
   escapedNewAlias=${newAlias//\'/\'\\\'\'}
   echo "alias $1='${escapedNewAlias}'" >> ~/.bash_aliases
   . ~/.bashrc
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

# make a function from history and put it in .bash_functions named $1
makeMacro () {
    if [ $# -eq 0 ]; then
        echo "No arguments supplied. You need to pass a name"
    else 
        commands="$(fc -rl -40 | fzf -m | awk -F $'\t ' '{print $2}')"

        if [ -z "$commands" ]
	then
            echo "No commands selected. Be sure to use Tab to select sections
	    of your history and enter when you're done."
        else 
# ugly block but it doesn't seem to work any other way
cat <<EOF >> ~/.bash_functions
$1 () {
    $commands
}
EOF

            echo $out
            . ~/.bashrc
        fi
    fi
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
    file=$(/usr/bin/ls -f *.zip | fzf -1 -0)
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


ff () {
  grep -rnw "$1" -e "$2"
}

g4 () {

    currentBranch=$(git branch --show-current)
    tempKey=${currentBranch#*-*-*}
    key=${currentBranch%"-$tempKey"}
    key=${key#*/}


    PS3='Select a commit tag:'
    options=("fix:" "refactoring:" "config:" "feat:" "doc:" "fix:" "infrastructure:" "style:")
    select opt in "${options[@]}"
    do 
        case $opt in
            *) tag=$opt; break;;
        esac
    done

    read -p 'Create a commit message:' msg

    git commit -p -m "$tag ($key):$msg"

}

g () {

    currentBranch=$(git branch --show-current)
    tempKey=${currentBranch#*-*-*}
    key=${currentBranch%"-$tempKey"}



    git ls-files --others --exclude-standard | fzf -m --preview 'cat {}' | xargs git add
    git add -p


    PS3='Select a commit tag:'
    options=("fix:" "refactoring:" "config:" "feat:" "doc:" "fix:" "infrastructure:" "style:")
    select opt in "${options[@]}"
    do 
        case $opt in
            *) tag=$opt; break;;
        esac
    done

    read -p 'Create a commit message:' msg

    git commit -m "$tag($key):$msg"
        
    
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

# Util

alias r='. ~/.bashrc && bind -f ~/.inputrc'
alias ls='lsd -la'
alias lg='lsd | grep'
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
alias uv="cd ~/.local/share/nvimplugged && find ./ -maxdepth 1 -type d | xargs -I x bash -c 'cd x; git fetch; git pull; cd -'"
alias c="clear"

# Navigation

alias code='cd ~/code'
alias why='why'
complete -F _why why
complete -F _agi3 agi3

alias idea='cd ~/idea'

alias pma='cd ~/projects/patientme/core/api'
alias pmw='cd ~/projects/patientme/core/patientme/packages/web-app'
alias pmn='cd ~/projects/patientme/core/patientme/packages/native-app'
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


alias gd='git checkout develop && git fetch && git pull origin develop' 
alias gD='git fetch origin develop:develop && git merge develop' 
alias gB='git checkout Beta && git fetch && git pull origin Beta && npm run dev'
alias gP='git checkout Prod && git fetch && git pull origin Prod && npm run dev'
alias gR='git checkout release && git fetch && git pull origin release'
alias p='git push origin HEAD'
alias add='git add -p'
alias com='git commit -m'
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
alias gx="git for-each-ref --sort=-committerdate --count=100 --format='%(refname:short)' refs/heads/ | fzf | xargs -I branch git checkout branch"


# Vagrant

alias halt='vagrant halt'
alias up='vagrant up'
alias vsh='vagrant ssh'
alias destroy='vagrant destroy -y'
alias hh='halt && hs'


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
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/colin/.nvm/versions/node/v9.6.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /home/colin/.nvm/versions/node/v9.6.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/colin/.nvm/versions/node/v9.6.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /home/colin/.nvm/versions/node/v9.6.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /home/colin/.nvm/versions/node/v9.6.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /home/colin/.nvm/versions/node/v9.6.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"


# source /usr/share/nvm/init-nvm.sh
eval "$(direnv hook bash)"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH


nvm use 23.8
. "$HOME/.cargo/env"

export PATH="$HOME/.cargo/bin:$PATH"
export LLVM_CONFIG=/usr/bin/llvm-config
