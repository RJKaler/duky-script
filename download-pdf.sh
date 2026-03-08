#!/bin/bash -e

#shellcheck disable=all

#NOTE: This is done with the assumption that the owners of Hak5 will not issue a takedown request for a copyright infringment 
#Run at your own risk. I do not endorse any unethical behavior regarding the actual physical manual. This is for a digital PDF and I don't think it's even sold in this form 

filesource="https://libgen.la/get.php?md5=8638619c05f6042d1b70b3658a2dba7b&key=WYLTVT5U83ADZXHV"

#   curl -L -O "$filesource"  || echo 'error'

while read -rep "Enter destination dir for download: " dir_target 
do
  if [[ -d "$dir_target" ]]; then 
    pushd "$dir_target" &>/dev/null &&
    break
  else 
    echo "Dir does not exist! Try again..." 
  fi
done

while :
do
  if curl -fL -O -C - --retry 50 --retry-delay 5 --retry-all-errors "$filesource"; then
        echo "Download complete!"
        break
    else
        echo "Download failed, retrying in 5s..."
        sleep 5s
    fi
done


