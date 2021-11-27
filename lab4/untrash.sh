#!/bin/bash

trashpath=~/.trash
filename=$1
regex="'.*/$filename'"
#echo $1
#echo $filename
#regex="'kek lol'"
#echo $regex
#echo `echo "kek lol" | grep -E "$regex"`
#echo "text"
#if ! [ `cat ~/.trash.log | grep '.*/'$filename` ]; then
#  echo "No such files in trash"
#  exit
#fi
#for line in `cat ~/.trash.log`;do
 #| grep -n -e '.*/'"$filename"`; do
while read line; do
  #echo $line
  #tmp=$(echo $line | grep -o -e '/[^/]*$')
  filename=`echo $line | awk -F'/' '{print $NF}'`
  echo $filename
  lineindex=0
 if [[ "$filename" = "$1" ]]; then
  #lineindex=`echo $line | awk -F':' '{print $1}'`
  index=`echo $line | awk -F'//' '{print $1}'`
  path=`echo $line | awk -F'//' '{print $2}'`
  #path=`echo $line | grep -o -e ':/.*' | cut -c 2-`
  echo "Untrash file $path?"
  read input < /dev/tty
  case $input in
    yes)
      dir=`echo $path | grep -o -e '.*/'`
      if ! [ -d $dir ]; then
        echo "Directory $dir do not exists. Untrashing file in $HOME"
        dir=$HOME
        path=$dir/$filename
      fi
      while [ -f $path ]; do
        echo "File $path already exists. Enter new name for untrashed file:"
        read name < /dev/tty
        path=$dir/$name
      done
      ln $trashpath/$index "$path"
      sed -i "${lineindex}d" ~/.trash.log
      rm $trashpath/$index
      ;;
    *)
      echo "skipped"
      ;;
  esac
  let lineindex=$lineindex + 1
 fi
done < ~/.trash.log
#done < ~/.trash.log
