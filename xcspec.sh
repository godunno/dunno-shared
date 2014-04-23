#!/bin/bash -e
if ! type "xctool" > /dev/null; then
  echo "xctool is required. to install it, type: brew install -v --HEAD xctool"
  exit 1;
fi


PARENT_DIR="$(dirname "${PWD}")"

function build_and_test()
{
  local xcworkspace_file="${PARENT_DIR}/$1/$2.xcworkspace"

  if ( [[ -d "$xcworkspace_file" ]] ) 
  then 
    echo "==================="
    echo "xBuild and xTest -> $1..."
    echo "==================="
    xctool -workspace $xcworkspace_file scheme $2 test -sdk iphonesimulator 
  else
    echo "==================="
    echo "File not found (${xcworkspace_file})"
    echo "All projects should be at the same path"
    echo "==================="
    exit 1; 
  fi
}

echo "Use projects path: ${PARENT_DIR}"

build_and_test "dunno-shared" "dunno-shared"
build_and_test "dunno-ios" "dunno"
build_and_test "dunno-ipad" "dunno-ipad"
