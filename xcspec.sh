#!/bin/bash
if ! type "xctool" > /dev/null; then
  echo "xctool is required. to install it, type: brew install -v --HEAD xctool"
  exit 1;
fi

xctool -workspace `pwd`/dunno-shared.xcworkspace -scheme dunno-shared test -sdk iphonesimulator 
