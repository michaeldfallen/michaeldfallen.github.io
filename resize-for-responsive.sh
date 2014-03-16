#!/bin/sh

scriptDir="$( dirname "$0" )"
absDir="$(cd "$scriptDir"; pwd)"
thisDir="$(pwd)"

usage() {
	echo `basename $0`: ERROR: $* 1>&2
	echo "usage: `basename $0` inputfile - resize \`inputfile\` for picturefill.js."
	exit 1
}

require() {
  dependancy=$2
  if [[ -z $dependancy ]]; then
    dependancy=$1
  fi
  hash $1 2>/dev/null || { 
    echo >&2 "$1 required but it's not installed.";
    echo >&2 "run \`brew install $dependancy\` then try again.";
    exit 1; 
  }
}

resize() {
  image=$1
  size=$2
  filename=${image%.*}
  ext=${image##*.}

  if [[ -z $image ]]; then
    usage "no input file provided"
  fi

  convert $image -resize "${size}x${size}" "$filename@$size.$ext"
  echo "resized $image to ${size}px x ${size}px at $filename@$size.$ext"
}

require "convert" "imagemagick"

resize $1 200
resize $1 400
resize $1 800
resize $1 1000
resize $1 2000
