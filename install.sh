#!/bin/bash

chmod +x *.sh
echo " "
echo "move file: gitscript-allin.sh -> /usr/bin/gitscript"
# echo "copy file: gitscript-allin.sh -> /usr/bin/gitscript"
echo " "
sleep 1
[ -f gitscript-allin.sh ] && mv gitscript-allin.sh /usr/bin/gitscript || echo -e 'error, no such file (gitscript-allin.sh) !!!\n'
# [ -f gitscript-allin.sh ] && cp gitscript-allin.sh /usr/bin/gitscript || echo -e 'error, no such file (gitscript-allin.sh) !!!\n'
echo "use -> gitscript {options}or{{input1}or/and{input2}}"
echo " "
echo "test -> gitscript --help"
echo " "
sleep 1
echo "if subtitle under displayed -> install OK"
echo " "
[ -f /usr/bin/gitscript ] && gitscript --help || echo -e 'error, there is something wrong...!!!\n'
