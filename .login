#
#   terminal characteristics
#
#   various TERM types:
#   ===================
#   ascii terminals: vt100, esprit-am
#   PCs: vt100, vt102
#   SUN workstation: sun
#   HP workstations: 300h, hp300 
#   X terminal emulator on HP: hpterm, xterm
#   IBM workstations: hft
#   X terminal emulator on IBM: aixterm
#
set noglob
if ("$TERM" != "dtterm") then
set t=(`tset -S -Q -m ":?$TERM"`)
setenv TERM $t[1]
unset t
endif
unset noglob
set term=$TERM

#
#   general terminal characteristics
#
stty erase "^H" kill "^U" intr "^C" eof "^D" susp "^Z" echoe opost
#
#   chooses this stty if you use VT series terminal
#
#stty erase "^?" kill "^U" intr "^C" eof "^D" susp "^Z" echoe opost

#
#   set file creation mask to owner access only
#
umask 077

#
#   commands to perform at login
#
#   examples (delete leading '#' to run)
#
#   enable mail arrival notification
#   NOTE: biff is not available on HP systems
#
biff y

#
#   shows the current date
#
date
