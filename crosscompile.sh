#!/bin/sh
if [ $# -ne 3 ]; then
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには3個の引数が必要です。" 1>&2
  echo "usage: $0 linux|freebsd|android|darwin|windows amd64|arm64 sourcefilename[.go]"
  exit 1
fi

export GOOS_TMP=$GOOS
export GOARCH_TMP=$GOARCH

case "$1" in
  "linux" | "freebsd" | "android" | "darwin" | "windows" ) export GOOS=$1 ;;
  * ) echo "usage: $0 linux|freebsd|android|darwin|windows amd64|arm64 sourcefilename[.go]" ; exit 2;
esac

case "$2" in
 "amd64" | "arm64" ) export GOARCH=$2 ;;
  * ) echo "usage: $0 linux|freebsd|android|darwin|windows amd64|arm64 sourcefilename[.go]" ; exit 3;
esac

filename=$3
filename=${filename%.*}

if [ $1 = "windows" ]; then
  extname="exe"
else
  extname=$1
fi

echo $GOOS
echo $GOARCH
go build -o $filename.$GOARCH.$extname $filename.go
file $filename.$GOARCH.$extname

export GOOS=$GOOS_TMP
export GOARCH=$GOARCH_TMP

unset GOOS_TMP
unset GOARCH_TMP
