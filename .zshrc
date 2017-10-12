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

fpath+=~/.zfunc

autoload -Uz compinit
compinit
# End of lines added by compinstall

export TERM=xterm-256color
export PATH=/home/jp/bin:/home/jp/.cargo/bin:/home/jp/scratch/confluent-3.3.0/bin:$PATH

[ ! -s $HOME/.antigen/antigen.zsh ] && git clone https://github.com/zsh-users/antigen.git .antigen
[ -s $HOME/.antigen/antigen.zsh ] && source $HOME/.antigen/antigen.zsh # This loads antigen

antigen bundle nojhan/liquidprompt
antigen apply

export NVM_SYMLINK_CURRENT="true" # nvm use should make a symlink
[ -s $HOME/.nvm/nvm.sh ] && source $HOME/.nvm/nvm.sh # This loads NVM

alias ls='ls --color=auto'
alias ll='ls -l'
alias vi='vim'
alias hg='hg --color=always'
alias less='less -r'
alias diff='colordiff -u'
alias sudo='sudo -E '
alias gti='git'
alias gitp='git'

#search history
bindkey '^r' history-incremental-search-backward

# vi mode in right prompt
function zle-line-init zle-keymap-select {
	VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
	RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=2

# In Vim backspace doesn't stop at the point where you started insert mode:
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# delete key
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

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
