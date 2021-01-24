# skelton file for setting all csh environment
#
# '$Id: cshrc,v 1.18 2004/04/12 05:55:06 yosiaki Exp $'

if (! $?NAISTHOSTTYPE) setenv NAISTHOSTTYPE `/share/script/hosttype`
if (! $?PARSED_ENV) eval `/share/lib/skel/env csh`

if ($?prompt) then
  set prompt="`hostname | cut -f1 -d. ` % "
  set notify
  set ignoreeof
  set history=50
  set filec
  alias ls  ls -CF
  alias ll  ls -l
  alias la  ls -a

  stty intr  ^C >& /dev/null
  stty erase ^H >& /dev/null
  stty kill  ^U >& /dev/null

  if ($NAISTHOSTTYPE == "irix" || $NAISTHOSTTYPE == "irix64") then
    stty ispeed 9600 ospeed 9600
    setenv LANG ja_JP.EUC
  endif
  if ($NAISTHOSTTYPE == "freebsd") then
    setenv LANG ja_JP.EUC
  endif
endif
setenv PERL_BADLANG 0
