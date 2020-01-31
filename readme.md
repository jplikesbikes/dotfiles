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

for my setup of ctrl-p (todo: make this optional)
```
pikaur -S the_silver_searcher
```

## core dumps
https://wiki.archlinux.org/index.php/Core_dump#Using_systemd
https://www.freedesktop.org/software/systemd/man/coredump.conf.html#

## Cool commands
`top -c -p $(pgrep -d',' -f name-of-your-process)`

## Java in sway
add to `/etc/environment`
```
_JAVA_AWT_WM_NONREPARENTING=1
```
