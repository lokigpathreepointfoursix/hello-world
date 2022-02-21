###
#   define operating system type
###
set OS=`/bin/uname`
set OS_REL=`/bin/uname -r`


#set editor in TeX
#setenv TEXEDIT "vi +%d %s"

#X Windows System application defaults file search path
setenv XAPPLRESDIR /usr/local/X11/lib/X11/app-defaults

###
#   operating system specific settings, commands and aliases
###

switch ($OS)
#
#   SunOS's specific settings, commands and aliases
#
case SunOS:
	switch ($OS_REL)
	case 4.1:
		set path = (/usr/ucb /usr/bin /usr/local/bin /usr/local/contrib/bin /usr/bin/X11 ~/bin)
		setenv MANPATH /usr/man:/usr/local/man
		breaksw	

	case 4.1.*:
		set path = ( /usr/ucb /usr/bin /usr/etc /usr/local/bin /usr/local/contrib/bin /usr/openwin/bin /usr/bin/X11 /usr/local/X11/bin /usr/local/bin/X11 ~/bin )
		setenv MANPATH /usr/man:/usr/openwin/man:/usr/local/man:/usr/lang/man
		breaksw

	case 5.*:
		#
		# dynamically setup the search path
		#
		set OPT_BIN = ""
		foreach DIR (`ls -d /opt/*/bin`)
			if ( "$OPT_BIN" == "" ) then
				set OPT_BIN=$DIR
			else
				set OPT_BIN=($OPT_BIN' '$DIR)
			endif
		end
		#
		# /usr/5bin changed to /usr/bin 
		# if you want to use System V program by preference, 
		# place /usr/bin before /usr/ucb
		#
		set path = (/usr/local/bin $OPT_BIN /usr/ccs/bin /usr/bin /usr/ucb /usr/openwin/bin /usr/dt/bin /usr/local/X11/bin /usr/local/kde/bin ~/bin)

		set OPT_MAN = ""
		foreach MAN (`ls -d /opt/*/man`)
			if ( "$OPT_MAN" == "" ) then
				set OPT_MAN=$MAN
			else
				set OPT_MAN=($OPT_MAN':'$MAN)
			endif
		end
 	setenv MANPATH /usr/local/man:${OPT_MAN}:/usr/man:/usr/openwin/man:/usr/dt/man
	setenv LD_LIBRARY_PATH /usr/dt/lib:/usr/openwin/lib:/usr/local/X11/lib:/usr/local/lib:/usr/local/kde/lib:/usr/local/qt/lib
		breaksw
	endsw
	breaksw
#
#   HP-UX's specific settings, commands and aliases
#
case HP-UX:
	#
	#   if you don't want auto log off after 60 idle minutes
	#
	unset autologout

	set path = (/bin /usr/bin/X11 /usr/bin /usr/local/bin ~/bin)
	setenv MANPATH /usr/man:/usr/contrib/man:/usr/local/man

	breaksw

#
#   AIX's specific settings, commands and aliases
#
case AIX:
	#
	#   adds your settings, commands and aliases here
	#
	set path = (/usr/ucb /usr/bin /usr/bin/X11 /usr/dt/bin /usr/local/bin /usr/local/X11/bin ~/bin)
	setenv MANPATH /usr/man:/usr/local/man

	breaksw

#
#   Silicon Graphics settings, commands and aliases
#
#   All bsd commands are under /usr/sbin 
#
case IRIX:
 	set path = (/usr/sbin /bin /usr/bin /usr/bsd /usr/local/bin /usr/bin/X11 ~/bin)
	setenv MANPATH /usr/man:/usr/catman:/usr/local/man
	breaksw
endsw

limit coredumpsize 0k
###
#   general settings for all OSs
###

#
#   set this to prevent overwriting existing files inadvertently
#
set noclobber

#
#   skip remaining setup if not an interactive shell
##
#if ($?prompt == 0) exit

#
#   general settings for interactive shells
#
set time=15
set history=40
set savehist=40
set notify
unset noglob
set hardpaths
set fignore
set nonomatch
#
# enable filename completion
#
set filec
#
# unset ignoreeof to logout with ^D
#
unset ignoreeof
#set prompt="`hostname`-`whoami` \! % "


#
#   environment variables
#
#   set PRINTER to the laser printer you normally use
#      laser printer for undergraduates: lg102a, lg103a, etc.
#      laser printer for M.Sc students: c401a
#      laser printers for postgraduates: hw501a, c316a, c405a, etc.
#      laser printers for staff: c316a, c405a, etc.
#
#setenv PRINTER lg102a
#setenv PRINTER c401a
#setenv PRINTER c316a

setenv PAGER /usr/local/bin/less

#
#   general aliases for all shells
#
alias del          'rm -i'
alias rm           'rm -i'
alias dir          'ls -l'
alias hi	   history
alias help         man
alias type         more
alias bye          logout
alias ls   	   'ls -FC'


#
#   to make the prompt includes the current path name, similar to DOS's $p$g
#
#set prompt="`hostname`:${cwd}\> "
#alias cd 'cd \!*; set prompt="`hostname`:${cwd}\> "'
set prompt="%B`hostname|cut -f1 -d.`:`whoami`:\!%B% "

###
# Setup the time zone
###
set TZ=HKT-8

###
# default editor
###
#set EDITOR=/usr/ucb/vi

# default file permission
umask 077
