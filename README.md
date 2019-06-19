# Snippets

## Shell

__Search files__

```
function :search() {
  grep -nR "$1" .
}
```

__Domain Registered?__

```
function :check() {
  whois $1 | grep "No match" || echo "Match for \"$1\""
}
```

__Copy File__

```
function :copy() {
 cat $1 | pbcopy
}
```

__Delete SWP Files__

```
function :clear_swps {
  find . -name "*.swp" -exec rm {} \;
}
```

__Configs__

```
# configs
alias :config_bash="vim ~/.profile"
alias :config_vim="vim ~/.vimrc"
alias :reload_bash="source ~/.profile"
```

__Forget Known Host__

```
function :ssh_forget {
    mv ~/.ssh/known_hosts known_hosts.backup
    cat ~/.ssh/known_hosts.backup | grep -v "$1" > ~/.ssh/known_hosts

    echo "modifications..."
    diff known_hosts known_hosts.backup
}
```

__Copy Pub Key__

```
function :ssh_key {
    PREFIX="$1"

    if [ -n "$PREFIX" ]; then
        cat ~/.ssh/${PREFIX}_id_rsa.pub | pbcopy
    else
        cat ~/.ssh/id_rsa.pub | pbcopy
    fi
}
```
