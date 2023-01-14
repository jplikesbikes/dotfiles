# dotfiles

+ install vcsh `pikaur -S vcsh`
+ then `vcsh clone git@github.com:jplikesbikes/dotfiles.git`
+ delete any files that are in conflict `rm -rf .config/vcsh`
+ and `vcsh dotfiles pull`

# system config
+ use https://github.com/CyberShadow/aconfmgr 
+ sort packages and files into logical groups and save in individual vcsh repos

# todo
+ [ ] put zsh config into multiple files
    + [ ] base
    + [ ] python
    + [ ] node
    + [ ] misc path updates
    + [ ] auto completes for specific tools
+ [ ] use multiple repos in vcsh 
    + [ ] base
    + [ ] python
    + [ ] node
    + [ ] logical system setting groups


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

for nvidia
install the driver and stop it from crashing on startup
https://wiki.archlinux.org/title/NVIDIA#Installation
add the following kernel parameters
```
nvidia-drm.modeset=1 ibt=off
```

Stop graphics from running on the nvidia card we only want it for cuda
edit `/etc/modprobe.d/nvidia.conf`
```
# dont blacklist nvidia, or nvidia_uvm those are needed for cuda
# blacklist the following since we don't want video to work
blacklist nvidia_drm
blacklist nvidia_modeset
blacklist nouveau
```

And to make sure gdm starts wayland
https://wiki.archlinux.org/title/GDM#Wayland_and_the_proprietary_NVIDIA_driver
```
ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
```

