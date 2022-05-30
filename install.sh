#!/bin/bash

chmod +x *.sh
echo " "
echo "move file: gitscript-allin.sh -> /usr/bin/gitscript"
## echo "copy file: gitscript-allin.sh -> /usr/bin/gitscript"
echo " "
sleep 1
### FILE MOVE ###
[ -f gitscript-allin.sh ] && mv gitscript-allin.sh /usr/bin/gitscript
## [ -f gitscript-allin.sh ] && cp gitscript-allin.sh /usr/bin/gitscript
if [ "$?" = '0' ]; then
  echo -n ""
else
  echo 'error, no such file (gitscript-allin.sh) !!!'
  echo " "
  echo "(exit...)"
  echo " "
  exit 
fi
echo "use -> gitscript {options}or{{input1}or/and{input2}}"
echo " "
echo "test -> gitscript --help"
echo " "
sleep 1
echo "if subtitle under displayed -> install OK"
echo " "
[ -f /usr/bin/gitscript ] && gitscript --help
if [ "$?" = '0' ]; then
  ### ONLY COPY METHOD => NO NEED ###
  rm -r ../gitscript
  cd /root/
  echo " "
  echo "Success! removed folder, exit the place -> cd /root/"
  echo " "
  echo "(wait 8 sec and close ALL terminal, OR PREVENT -> Ctrl + c !!!)"
  echo " "
  sleep 8
  kill "$(pidof -x qterminal)"
  exit
else
  echo 'error, there is something wrong...!!!'
  echo " "
  echo "(exit...)"
  echo " "
  exit
fi
