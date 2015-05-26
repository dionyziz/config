#!/bin/bash

cd "$(dirname "$0")"

git submodule init
git submodule update

all=false
for file in $(ls -a|grep "^\.[a-z]"|grep -v "^\.git$")
do
  yes=false
  if [[ "$all" = false ]] 
  then
    read -p "Link $file? (Y)es/(N)o/(A)ll/(Q)uit? "
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      yes=true
    fi
    if [[ $REPLY =~ ^[Aa]$ ]]
    then
      yes=true
      all=true
    fi
    if [[ $REPLY =~ ^[Qq]$ ]]
    then
      exit
    fi
  fi
  if [ "$yes" = true -o "$all" = true ]
  then
    echo "Linking file $file"
    ln -v -s `pwd`/$file ~
  fi
done
