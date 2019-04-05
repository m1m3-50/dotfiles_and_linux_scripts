# Dots and config

## contents

This repository is my backup and sandbox for my environment configuration.

As I believe some might fight it useful, I will try to include as much as
possible, as long as I keep my privacy.

I actually do use this config as my daily driver, so you can find some options
here either very useful or just not fitting your taste at all.

**my OS and Hardware**

This configuration is run on and tested with:
* Void Linux
* Huawei MateBook X Pro
  * Intel Core i7 8550U
  * nVidia GeForce MX-150 (for experimental support of config, visit nvidia branch)
  * 16GB RAM
  * 3:2 (running at 1800x1200) 3K touch screen
* external 27' monitor (with res 1980x1080 and 144Hz refresh rate)

## how does it look like
**both screens**  
![both screens][both]

**config workspace**  
![config workspace][config]

**secondary screen**  
![secondary screen][secondary]

**a little bonus: my bash prompt**  
![bash prompt][bash_prompt]

## requirements

This configuration uses and depends on:
* i3-gaps (window manager)
* polybar (status bar)
* font-awesome v4
* compton (for composition)
* feh (for wallpapers)
* urxvt (rxvt-unicode)
* firefox
* gotop (for monitoring)
* pulseaudio + pulseeffects + pavucontrol (for sound management)
* irssi (IRC client)
* cmatrix (yeah, I know...)
* wicd (for managing network connections)
* (TODO: check and complete the list)


## installation

There is an automated deploy script (I'd say it's a beta now), with which installation requires following steps:
```bash
git clone https://github.com/m1m3-50/dotfiles_and_linux_scripts.git && cd dotfiles_and_linux_scripts
# to change my own home directory for yours. . .
sed -i -e 's/\/home\/mime/\/home\/YOUR_USERNAME_COMES_HERE/g' .config/i3/config-*

./deploy.sh
```
**Please be reminded that using config files from this repository is free, but creator and/or contributors do not hold any responsibility for changes that will occur on your system. Use on your own risk. It is thus much recommended to first check all the scripts for yourself and make sure you understand what they may do and how to use them.**

## plans and priorities

**What is what**
1. H    = high
2. M    = medium
3. L    = low
4. NTH  = nice to have
5. WFI  = waiting for ideas
6. IP   = in progress

|feature                      |priority |
|---                          |---      |
|i3-lock beautify             |NTH      |
|automated installation       |IP       |
|custom screenshot bindings   |M        |
|recheck list of dependencies |H        |
|add more themes (as branches)|L        |
|create suckless branch       |NTH      |
|more automated scripts       |WFI      |
|?|?|

[config]: https://i.imgur.com/iJiXqem.png "Mr Mime's config screen"
[secondary]: https://i.imgur.com/yjUzix6.png "Mr Mime's secondary screen"
[both]: https://i.imgur.com/fboc1Z7.png "Mr Mime's both screens"
[bash_prompt]: https://i.imgur.com/GCnNRXa.png "Mr Mime's bash prompt"
