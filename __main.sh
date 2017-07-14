#!/bin/bash

commit_github(){
  git init
  git add .
  git config --global user.email brunogomes.comp@gmail.com
  git commit -m "Initial commit"
  #git remote add origin bgomes06@github.com:bgomes06/docker_base.git
  git remote rm origin
  git remote add origin https://github.com/bgomes06/docker_base.git
  git push -u origin master
}

create_repo(){
  curl -u 'bgomes06' https://api.github.com/user/repos -d '{"name":"docker_base"}'
}

create_container(){
  docker build -t teste:1.0 .
}

clone_infoblox(){
  git clone https://github.com/Infoblox-Development/Infoblox-API-Python.git
}

my_bashrc(){
  cat config/.bashrc >> /root/.bashrc
}
