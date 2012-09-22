# Utilities
# ---------------------------------------------------------------------------------------

alias vi='vim'
alias lsh='ls -lhGFr'
alias lsa='ls -lhaGFr'
alias nicedate='date "+%Y-%m-%d"'
alias nicedatetime='date "+%Y-%m-%d %H:%M"'
alias ffind='find -E . -type f -regex'
alias iaw='open -a iA\ Writer'

# Create and change into a new directory
function take() {
    mkdir -p "$*"
    cd "$*"
}

# Working with these dotfiles made easier
alias reload='source ~/.bashrc'
alias ea='vim ~/.bashrc && reload' # Edit aliases

# To Do files
alias td='cat TODO'                  # what to do
alias tdn='head -1 TODO'             # what to do next
alias tdc='sed "/^$/d" TODO | wc -l' # to do count
alias tdd='sed "1d" TODO > TODO'     # mark next to do done
alias tdg='cat TODO | grep'          # what to do grep

# Pretty printing files
function pp() {
  pygmentize -f terminal256 "$1" | less -R
}

# Other
alias apache-config='sudo vim /etc/apache2/httpd.conf'
alias apache-check='sudo apachectl configtest'
alias apache-restart='sudo apachectl graceful'
alias apache-vhosts='sudo vim /etc/apache2/extra/httpd-vhosts.conf'
alias postgres-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgres-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias postgres-kill='ps aux | grep backoffice_development | grep -v grep | awk "{print \$2}" | xargs kill'
alias pg='psql -d backoffice_development'
alias redis-start='redis-server /usr/local/etc/redis.conf'

# Git
# ---------------------------------------------------------------------------------------
alias ga='git commit --amend'
alias gap='git add -p'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gdd='git difftool'
alias gds='git diff -w --staged'
alias gdw='git diff --word-diff'
alias gdws='git diff --staged --word-diff'
alias gl='git log --pretty=format:"%C(yellow)%h%C(reset)|%C(bold blue)%an%C(reset)|%s" | column -s "|" -t | less -FXRS'
alias glog='git log --pretty=format:"%C(yellow)%h%C(reset) %C(green)%ar%C(reset) %C(bold blue)%an%C(reset) %C(red)%d%C(reset) %s" --graph --abbrev-commit --decorate'
alias gm='git merge --no-ff --no-commit'
alias gmc='git ls-files --unmerged | cut -f2 | uniq' # git merge conflicts
alias gmf='git commit -F .git/MERGE_MSG'
alias gmnff='git merge --no-ff'
alias go='git checkout'
alias gpom='git push origin master'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grd='git rm $(git ls-files -d)'   # git remove deleted
alias grs='git rebase --skip'
alias gs='git status -b -s --ignore-submodules=dirty'
alias gsd='git svn dcommit'
alias gsf='git svn fetch'
alias gsr='git svn rebase'
alias gtimelog='! git --no-pager log --pretty=format:"%C(red)%h%C(reset){%C(green)%cd%C(reset){%C(bold blue)%an%C(reset){%s" --date=iso | column -t -s"{" | less -FXRS'
alias gw='git whatchanged --oneline'
alias gz='git archive -o snapshot.zip HEAD'

# Commit pending changes and quote all args as message
function gg() {
    git commit -v -a -m "$*"
}

# Bundler
alias be='bundle exec'

# Add ./bin to PATH to use bundler binstubs
alias binstubs='export PATH=./bin:$PATH'

function heroku_deploy_to() {
    remote=$1
    branch=$2
    git push origin $2 &&
    git push $1 $2:master &&
    heroku maintenance:on --remote $1 &&
    heroku run rake db:migrate --remote $1 &&
    heroku restart --remote $1 &&
    heroku maintenance:off --remote $1
}

# Function for symlinking apps into ~/.pow
function kapow() {
    name=`basename $PWD`
    echo "Using name: $name"
    rm ~/.pow/$name
    ln -s $PWD ~/.pow/$name
    echo "Created pow rails app at: http://$name.dev"
}

# Rake
alias migrate='rake db:migrate db:test:prepare'
alias remigrate='rake db:drop db:create db:migrate db:test:prepare'

# Heroku
alias hrl='heroku logs -t'
alias hr='heroku'
alias hrr='heroku run'
alias hrake='heroku run rake'

# Rsync
alias sync='rsync -glpPrtvz --delete --exclude .svn --exclude .DS_Store --exclude .sass-cache'

export EDITOR="/usr/local/bin/vim"
export SVN_EDITOR=$EDITOR
export PATH="/Users/arjan/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PYTHONPATH=/usr/local/lib/python2.6/site-packages
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
