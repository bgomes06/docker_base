#!/bin/bash

commit_github(){
  git init
  git add .
  git commit -m "Initial commit"
  git remote add origin bgomes06@github.com:bgomes06/docker_base.git
  git push -f origin master
}

create_repo(){
  curl -u 'bgomes06' https://api.github.com/user/repos -d '{"name":"docker_base"}'
}

create_container(){
  docker build -t teste:1.0 .
}