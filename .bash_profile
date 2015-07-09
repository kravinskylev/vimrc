
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH:/usr/lib"

# Git aliases
alias gs="git status"
alias gd="git diff --patience --ignore-space-change"
alias gc="git checkout"
alias gb="git branch"
alias ga="git add"
alias gh="git hist"
alias gac="git add . && git commit -m "
alias gp="git push"
alias g="git"
alias cdd="cd && cd Desktop"
alias v="mvim"
alias l="ls"
alias ..="cd .."
alias cdt="cdd && cd Turing"
alias md="mkdir"
alias gpu="git push --set-upstream origin HEAD"
alias gpu="git pull"
alias clone="git clone"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset \
%an: %s - %Creset %C(yellow)%d%Creset \
%Cgreen(%cr)%Creset' --abbrev-commit --date=relative" # pretty log
alias gph="git push heroku master"
alias r="ruby"
alias i="irb"
alias ra="rails"
alias rs="ra s -p 3001"
alias rk="rake"
alias sg="shotgun"
alias rc="rails c"
alias dbc="bundle exec rake db:create"
alias dbm="bundle exec rake db:migrate"
alias dbset="bundle exec rake db:setup"
alias dbr="bundle exec rake db:reset db:seed"
alias be="bundle exec"
alias routes="rake routes"
alias bi="bundle install"
alias ri="rails g rspec:install"
alias u="unicorn"
alias in="sudo gem install"

function goo() {
local s="$_"
local query=
case "$1" in
    '')   ;;
    that) query="search?q=${s//[[:space:]]/+}" ;;
    *)    s="$*"; query="search?q=${s//[[:space:]]/+}" ;;
esac
open -a "Google Chrome" "http://www.google.com/${query}"
}

function wi() {
local s="$_"
local query=
case "$1" in
    '')   ;;
    that) query="${s//[[:space:]]/_}" ;;
    *)    s="$*"; query="${s//[[:space:]]/_}" ;;
esac
open -a "Google Chrome" "https://en.wikipedia.org/wiki/${query}"
}

function railsp() {
  rails new $1 -T -B --skip-turbolinks --database=postgresql

  cd $1

  add_rails_gems
  bundle
  rails generate rspec:install

  git init
  git add .
  git commit -m "initial commit"

  mvim .;
}

function add_rails_gems() {

echo "
group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'pry/byebug'
end
" >> Gemfile;

}


# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
export PATH
