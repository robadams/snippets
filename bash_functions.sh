# utils

function :search() {
  grep -nR "$1" .
}

function :check() {
  whois $1 | grep "No match" || echo "Match for \"$1\""
}

function :copy() {
 cat $1 | pbcopy
}

function :clear_swps {
  find . -name "*.swp" -exec rm {} \;
}

# alias
alias :config_bash="vim ~/.profile"
alias :config_vim="vim ~/.vimrc"
alias :reload_bash="source ~/.profile"

# ssh

function :ssh_forget {
    mv ~/.ssh/known_hosts known_hosts.backup
    cat ~/.ssh/known_hosts.backup | grep -v "$1" > ~/.ssh/known_hosts

    echo "modifications..."
    diff known_hosts known_hosts.backup
}

function :ssh_key {
    PREFIX="$1"

    if [ -n "$PREFIX" ]; then
        cat ~/.ssh/${PREFIX}_id_rsa.pub | pbcopy
    else
        cat ~/.ssh/id_rsa.pub | pbcopy
    fi
}
