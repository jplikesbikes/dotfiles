# dotfiles

+ install vcsh `pikaur -S vcsh`
+ then `vcsh clone git@github.com:jplikesbikes/dotfiles.git` 
+ delete any files that are in conflict `rm -rf .config/vcsh` 
+ and `vcsh dotfiles pull`

## Vim
Can't currently autoinstall everything needed for my vimrc.
You need to install [vim-youcompleteme-git](https://aur.archlinux.org/packages/vim-youcompleteme-git/)
and finish up the install of [ternjs/tern_for_vim](https://github.com/ternjs/tern_for_vim)
```
pikaur -S vim-youcompleteme-git
cd .vim/plugged/tern_for_vim  && npm install
rustup component add rust-src
```

for ensime (todo:
```
pikaur -S python2-sexpdata python2-websocket-client
```

for my setup of ctrl-p (todo: make this optional)
```
pikaur -S the_silver_searcher
```

## Cool commands
`top -c -p $(pgrep -d',' -f name-of-your-process)`
