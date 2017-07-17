#!/bin/bash

commit_github(){
  read -p "Insert your commit message: " message
  git init
  git add .
  git config --global user.email brunogomes.comp@gmail.com
  git commit -m "$message"
  #git remote add origin bgomes06@github.com:bgomes06/docker_base.git
  git remote rm origin
  git remote add origin https://github.com/bgomes06/docker_base.git
  git push -u origin master
}

create_repo(){
  read -p "Insert the name of your new repo: " repo_name
  curl -u 'bgomes06' https://api.github.com/user/repos -d '{"name":"$repo_name"}'
}

create_container(){
  docker build -t teste:1.0 .
}

clone_infoblox(){
  git clone https://github.com/Infoblox-Development/Infoblox-API-Python.git /root
}

my_config(){
  egrep "my_config" /root/.bashrc 2>/dev/null
  if [ ! -f /root/.bashrc ] || [ $? != 1 ]; then
    cat config/.bashrc >> /root/.bashrc
    source /root/.bashrc
  fi
}

## ------ START PROGRAM ------

clear
echo "Select your activity:
  1) Config environment
  2) Commit to github docker_base
  3) Create repository
  4) Clone Infoblox
  "

read -p "Activity: " option

case $option in
  1) my_config
  ;;
  2) commit_github
  ;;
  3) create_repo
  ;;
  4) clone_infoblox
  ;;
  *) echo "Invalid option" && exit 1
  ;;
esac
