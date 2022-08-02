# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jp/.zshrc'

fpath=($fpath ~/.zsh/completion)

autoload -Uz compinit
compinit
# End of lines added by compinstall

export TERM=xterm-256color
export PATH=/home/jp/.cargo/bin:/home/jp/bin:/opt/confluent/confluent-5.0.1/bin:/home/jp/.local/bin/:$PATH

[ ! -s $HOME/.zinit/zinit.zsh ] && git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit
[ -s $HOME/.zinit/zinit.zsh ] && source $HOME/.zinit/zinit.zsh # This loads antigen

zinit light zsh-users/zsh-autosuggestions
zinit light nojhan/liquidprompt
zinit snippet OMZ::lib/termsupport.zsh

# configure autosuggests
# ctrl-space to accept suggestion
bindkey '^ ' autosuggest-accept

export EDITOR=vim

# allow less to display utf-8 characters
export LC_CTYPE=en_US.UTF-8
export LESSCHARSET=utf-8
export NVM_SYMLINK_CURRENT="true" # nvm use should make a symlink
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
zinit light lukechilds/zsh-nvm # This load nvm on first use of node, npm, etc

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

alias ls='ls -lhH --color=auto'
alias vi='vim'
alias hg='hg --color=always'
alias less='less -R'
alias diff='colordiff -u'
alias sudo='sudo -E '
alias gti='git'
alias gitp='git'
alias gi='git'
alias docker-exec='docker exec -it -e COLUMNS=$COLUMNS -e LINES=$LINES -e TERM=$TERM'
# alias env='env | sort | awk -F = '"'"'{ print "\033[1;35m" $1 "\033[0m = " $2; }'"'"''
alias ls-ln='find node_modules -maxdepth 1 -type l -ls'
alias bc='bc -l'

# fzf default command to ripgrep
if type "rg" > /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
fi

# multi-mv
autoload -U zmv
alias mmv='noglob zmv -W'

#search history
bindkey '^r' history-incremental-search-backward

#open vim in ctrl-p using ctrlp
ctrlp() {
  </dev/tty vim -c CtrlP
}
zle -N ctrlp
bindkey "^p" ctrlp

# fzf in shell with ctrl-t
[ -s /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -s /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

#open vim in ctrl-p using ctrlp
ctrla() {
  </dev/tty vim -c Grepper
}
zle -N ctrla
bindkey "^a" ctrla

# vi mode in right prompt
function zle-line-init zle-keymap-select {
	VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
	RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=2

# ctrl + arrows for history completion
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# In Vim backspace doesn't stop at the point where you started insert mode:
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# delete key
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

# easier up and down
bindkey "^k" up-line-or-history
bindkey "^j" down-line-or-history

# home and end
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# set psql
export PSQL_EDITOR=vim


if [  ]; then source <(kubectl completion zsh); fi
if [  ]; then source <(argocompletion zsh); fi
eval $(thefuck --alias f)

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export PATH="/home/jp/.local/bin:$PATH"

# Wasmer
export WASMER_DIR="/home/jp/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
