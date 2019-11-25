#!/bin/bash
if [[ "$1" == "" ]]; then echo "Please supply a directory name as an argument."
  elif [[ "$1" =~ " " ]]; then echo "Error: project name includes spaces. Use spinal-case instead"; return 0;
  elif [[ "$2" != "" ]];  then echo "Error: multiple arguments detected. Project name should have no spaces. Use spinal-case instead"; return 0;
else
  if [[ "$1" =~ [[:upper:]] ]]
  then
    echo "Uppercase letters detected. Converting to lowercase..."
    set -- ${1,,}
  fi
  dir=$(pwd)
  newdir="$dir/$1"
  echo "Creating directory: $newdir and moving to it..."
  if [[ -d "$1" ]]
  then echo "Directory '$1' Exists! Proceed anyway?"
    gotInput=0
    while [ $gotInput -eq 0 ]
    do
      read -p "Y(es)/N(o), Enter defaults to N: " writeInto
      if [[ $writeInto =~ ^Y|y(es)*$ ]]
      then
        echo "OK, writing into $1"; gotInput=1
      elif [[ $writeInto =~ ^(N|n(o)*)*$ ]]
      then echo "Exiting..."; return 0;
      else echo "I didn't understand your response, '$writeInto'"
      fi
    done
  fi
  mkdir -p $newdir
  cd $1
  npm init --yes
  git init
  touch .gitignore && echo node_modules>.gitignore
fi