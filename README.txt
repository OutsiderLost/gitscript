# gitscript
github automatization downloader with https-token. Possible input: username and/or reponame and link.

==========================================================
(install)
git clone https://github.com/OutsiderLost/gitscript.git
cd gitscript
chmod +x *.sh

(add your username & token)
nano gitscript-sec.sh
mv gitscript-sec.sh /usr/bin/gitscript

(or autochange your username & token)
gitscript -c # or --change
==========================================================
(usage)
gitscript -h # or --help

use examples:

./gitscript.sh repoexample.git
./gitscript.sh USERNAME repoexample.git
./gitscript.sh https://github.com/USERNAME/repoexample.git
==========================================================
(gitscript-sec version advantages and disadvantages)

If token value travels online (during some transmission) github can disable and new one must be created.
The "sec" version prevents this with some simple conversion methods.
But that is why it can be more disadvantageous from a security point of view...
The User does not see the token directly in script (must be converted).

(gitscript-allin full version, which also allows you to create a plain or hidden token)

