:: cygwin install from windows command line, since there's no mintty yet
::
:: Reference: 
::            https://stackoverflow.com/questions/745275/can-i-script-a-cygwin-install-to-include-certain-packages
::            https://stackoverflow.com/questions/2997578/how-do-i-comment-on-the-windows-command-line
::
rem
echo "Info   : download setup.exe first."
echo "         https://www.cygwin.com/setup-x86_64.exe "
setup-x86_64.exe ^
--quiet-mode ^
--categories base ^
--packages ^
_autorebase,^
autoconf,^
bash,^
binutils,^
curl,^
cygutils,^
cygwin,^
dos2unix,^
emacs,^
emacs-X11,^
gawk,^
gcc-core,^
gettext,^
gettext-devel,^
git,^
git-gui,^
gitk,^
grep,^
gvim,^
gzip,^
inetutils,^
less,^
lua,^
lua-devel,^
make,^
ncurses,^
openssh,^
perl,^
python3,^
ruby,^
run,^
sed,^
tcl,^
tcl-devel,^
tcl-tk,^
tcl-tk-devel,^
tmux,^
tree,^
unzip,^
vim,^
wget,^
wput,^
xinit,^
xlaunch,^
xorg-server,^
zip
