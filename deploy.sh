#!/bin/bash

dotspath=`realpath $0 | xargs dirname`

# ------ UTIL FUNCTIONS BLOCK ------

function conflict_resolve {
  select opt in "Backup old and deploy" "Replace" "Skip"; do
    case $opt in
      "Backup old and deploy") mv ~/.config/$1 ~/.config/${1}.`date +s`.bkp
      ln -s $dotspath/.config/$1 ~/.config
      break
      ;;
      "Replace") rm ~/.config/$1
      ln -s $dotspath/.config/$1 ~/.config/
      printf "replaced!"
      break
      ;;
      "Skip") printf "skipped!"
      break
      ;;
    esac
  done
}

function check_and_deploy_file {
  select opt in "Backup old and deploy" "Replace" "Skip"; do
    case $opt in
      "Backup old and deploy") mv $2/$1 $2/${1}.`date +s`.bkp
      ln -s $1 $2/
      break
      ;;
      "Replace") rm $2/$1
      ln -s $1 $2/
      printf "replaced!"
      break
      ;;
      "Skip") printf "skipped!"
      break
      ;;
    esac
  done
}

# --- END OF UTIL FUNCTIONS BLOCK --

# Deployment sequence below


printf "Deploying .config directory contents... \n"
for entry in `ls .config`; do
  printf $entry
  if [ -f .config/$entry ]; then
    # for file
    if [ -f ~/.config/$entry ]; then
      printf " . . .already exists in config directory, what should I do?\n"
      conflict_resolve $entry
    else
      ln -s $dotspath/.config/$entry ~/.config/
      printf " . . .OK"
    fi
  elif [ -d .config/$entry ]; then
    # for directory
    if [ -d ~/.config/$entry ]; then
      printf " . . .already exists in config directory, what should I do?\n"
      conflict_resolve $entry
    else
      ln -s $dotspath/.config/$entry ~/.config/
      printf " . . .OK"
    fi
  fi
  printf "\n"
done

printf "Deploying X files. . ."
for homexfile in ".xinitrc" ".Xresources"; do
  if [ -f ~/$homexfile ]; then
    check_and_deploy_file $dotspath/.xorg/$homexfile ~/
  else
    ln -s $dotspath/.xorg/$homexfile ~/
  fi
done
for etcxfile in "xorg.conf-intel" "xorg.conf-nvidia"; do
  if [ -f /etc/X11/$etcxfile ]; then
    check_and_deploy_file $dotspath/.xorg/$etcxfile /etc/X11/
  else
    ln -s $dotspath/.xorg/$etcxfile /etc/X11/
  fi
done
