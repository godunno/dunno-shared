#!/bin/bash
if ! type "xctool" > /dev/null; then
  echo "xctool is required. to install it, type: brew install -v --HEAD xctool"
  exit 1;
fi

current_directory=${PWD##*/}
xctool -workspace `pwd`/${current_directory}.xcworkspace -scheme ${current_directory} test -sdk iphonesimulator 
