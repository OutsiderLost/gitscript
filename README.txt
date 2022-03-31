# gitscript
github automatization downloader with https-token. Possible input: username and/or reponame and link.

==========================================================
(install)
git clone https://github.com/OutsiderLost/gitscript.git
cd gitscript
chmod +x *.sh

(add your username & token)
nano gitscript.sh
mv gitscript.sh /usr/bin/gitscript

(or autochange your username & token)
gitscript -c # or --change
==========================================================
(usage)
gitscript -h # or --help

use examples:

./gitscript.sh repoexample.git
./gitscript.sh USERNAME repoexample.git
./gitscript.sh https:// github.com/USERNAME/repoexample.git
==========================================================
