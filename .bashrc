
:
: '$Id: bashrc,v 1.6 2003/06/20 01:15:29 yosiaki Exp $'

case .$HOSTTYPE in .) HOSTTYPE=`/share/script/hosttype`;; esac
case .$PARSED_ENV in .) eval `/share/lib/skel/env sh`;; esac
case .$Machine in .) Machine=$HOSTTYPE;; esac
case .$Machine in
.decstation) Machine=mips;;
.iris4d) Machine=irix;;
esac

case .$PS1 in
.) ;;
*)
  PS1="\h $ "
  notify=true
  ignoreeof=true
  HISTSIZE=1000
  history_control=ignoredups
  : Alias definition
  alias a=alias
  alias pd=pushd
  alias pop=popd
  alias help=apropos
  alias vt100="set term = vt100"
  alias rs='resize > /dev/null'
  alias setlang='setenv LANG ja_JP.\!$; stty a\!$'
  alias showlang='(stty -a > /dev/tty) 2>&1 |  grep term;echo -n "LANG = ";printenv LANG'
  ;;
esac

CUDAROOT=/usr/local/cuda-10.2
NCCL_ROOT=/

export CPATH=$NCCL_ROOT/include:$CPATH
export LD_LIBRARY_PATH=$NCCL_ROOT/lib/:$CUDAROOT/lib64:$LD_LIBRARY_PATH
export LIBRARY_PATH=$NCCL_ROOT/lib/:$LIBRARY_PATH
export CFLAGS="-I$CUDAROOT/include $CFLAGS"
export CPATH=$CUDAROOT/include:$CPATH
export CUDA_HOME=$CUDAROOT
export CUDA_PATH=$CUDAROOT

cd ~/
pyenv local system
USER=yuka-ko

#echo '[kerberos status]'
# ps aux | grep krenew | grep yuka-ko

#ps_out=`ps aux | grep krenew | grep yuka-ko`
#ps_out_kre=`echo $out | grep '/home/is/yuka-ko/.krenewprocess/'`
#krelen=${#ps_out_kre}


# kerberos authorization
if test ${TERM} != "ansi" ; then
  if which krenew > /dev/null 2>&1 ; then
    if ps uxww | grep krenew | grep -q yuka-ko ; then
      :
    else
      kinit -p -r 20d ${USER}
      while test $? -ne 0 ; do
        kinit -p -r 20d ${USER}
      done
      krenew -K 10 -b -a 
    fi
  fi
fi

      #-p ~/.krenewprocess/${USER}.$$
# sudoh sensei ver
#if test ${TERM} != "ansi" ; then
#    if which krenew > /dev/null 2>&1 ; then
#        if ps uxww | grep krenew | grep -q tmp ; then
#            ;
#        else
#            kinit -p ${USER}
#            while test $? -ne 0 ; do
#                kinit -p ${USER}
#            done
#            krenew -K 10 -b -p /tmp/.krenew_${USER}.$$
#        fi
#    fi
#fi
#
#

klist 


#if which krenew > /dev/null 2>&1 ;then
#  if ps uxww | grep krenew | grep -q yuka-ko ;then
#    kinit -p -r 300d
#    #krenew -a -K 30 -b
#    krenew -K 10 -b -p ~/.krenewprocess.txt
#  else
#    while test $? -ne 0;do
#      kinit -p -r 300d
#    done
#    #krenew -a -K 30 -b 
#    krenew -K 10 -b -p ~/.krenewprocess.txt
#    fi
#fi


# https://qiita.com/varmil/items/9b0aeafa85975474e9b6
# ps1
#export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[35m\]:\[\033[01;36m\]\w\[\033[00m\]\[\033[01;35m\]$(__git_ps1 "(%s)")\[\033[0m\]\$ '
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\h\[\033[36m\]:\[\033[01;36m\]\w\[\033[00m\]\[\033[01;36m\]$(__git_ps1 "(%s)")\[\033[0m\]\$ '

# show git
if type __git_ps1 > /dev/null 2>&1 ; then
  PROMPT_COMMAND="__git_ps1 '\h:\W \u' '\\\$ '; $PROMPT_COMMAND"
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWSTASHSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=
  GIT_PS1_SHOWUPSTREAM=1
  GIT_PS1_SHOWCOLORHINTS=1
fi

export GIT_PS1_SHOWDIRTYSTATE=true GIT_PS1_SHOWSTASHSTATE=true



# fake __git_ps1 when git-prompts.sh not installed
if [ "$(type -t __git_ps1)" == "" ]; then
  function __git_ps1() { :; }
fi
#
#
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv virtualenv-init -)"
export PATH="/home/is/yuka-ko/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
export PATH="/home/is/yuka-ko/.local/bin:$PATH"
export PYENV_ROOT="${HOME}/.pyenv"
export PATH=${PYENV_ROOT}/bin:$PATH
eval "$(pyenv init -)"
#

###################
# kaldi, espnet path
#TOOL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
TOOL_DIR=/project/nakamura-lab09/Work/yuka-ko/espnet/tools
KALDI_TOOL_DIR="$TOOL_DIR"/kaldi/tools

if [ -z "${TOOL_DIR}" ]; then
    echo "ERROR: Cannot derive the directory path of espnet/tools. This might be a bug."
    return 1
fi


export PATH="${TOOL_DIR}"/sph2pipe_v2.5:"${PATH:-}"
export PATH="${TOOL_DIR}"/sctk-2.4.10/bin:"${PATH:-}"
export PATH="${TOOL_DIR}"/mwerSegmenter:"${PATH:-}"
export PATH="${TOOL_DIR}"/moses/scripts/tokenizer:"${TOOL_DIR}"/moses/scripts/generic:"${TOOL_DIR}"/tools/moses/scripts/recaser/:"${TOOL_DIR}"/moses/scripts/training/"${PATH:-}"
export PATH="${TOOL_DIR}"/nkf/nkf-2.1.4:"${PATH:-}"
export PATH="${TOOL_DIR}"/PESQ/P862_annex_A_2005_CD/source:"${PATH:-}"
export PATH="${TOOL_DIR}"/kenlm/build/bin:"${PATH:-}"
export LD_LIBRARY_PATH="${TOOL_DIR}"/lib:"${TOOL_DIR}"/lib64:"${LD_LIBRARY_PATH:-}"

echo $PATH
echo "\n"

export PATH="${KALDI_TOOL_DIR}"/sph2pipe_v2.5:"${PATH:-}"
export PATH="${KALDI_TOOL_DIR}"/sctk-2.4.10/bin:"${PATH:-}"
export PATH="${KALDI_TOOL_DIR}"/mwerSegmenter:"${PATH:-}"
export PATH="${KALDI_TOOL_DIR}"/moses/scripts/tokenizer:"${KALDI_TOOL_DIR}"/moses/scripts/generic:"${KALDI_TOOL_DIR}"/tools/moses/scripts/recaser/:"${KALDI_TOOL_DIR}"/moses/scripts/training/"${PATH:-}"
export PATH="${KALDI_TOOL_DIR}"/nkf/nkf-2.1.4:"${PATH:-}"
export PATH="${KALDI_TOOL_DIR}"/PESQ/P862_annex_A_2005_CD/source:"${PATH:-}"
export PATH="${KALDI_TOOL_DIR}"/kenlm/build/bin:"${PATH:-}"
export LD_LIBRARY_PATH="${KALDI_TOOL_DIR}"/lib:"${KALDI_TOOL_DIR}"/lib64:"${LD_LIBRARY_PATH:-}"

###########

stty erase '^?'

# add path for gcc
source /project/nakamura-lab08/Work/bin-wu/share/tools/gcc/path.sh
# add path for bc (for wsj script of kaldi)
export PATH=/project/nakamura-lab08/Work/bin-wu/.local/bc/bin:$PATH

#export PATH=/project/nakamura-lab09/Work/yuka-ko/espnet/tools/venv/bin:$PATH
#export PATH=/project/nakamura-lab09/Work/yuka-ko/espnet/tools/venv.back/bin:$PATH
#export PATH="/home/is/yuka-ko/.pyenv/bin:$PATH"

#export PATH="/home/is/yuka-ko/.pyenv/bin:$PATH"
export PATH=/project/nakamura-lab09/Work/yuka-ko/espnet/tools/venv/bin:$PATH



#/project/nakamura-lab09/Work/yuka-ko/espnet/tools/venv.back/bin/




#export PATH=/project/nakamura-lab09/Work/yuka-ko/espnet/tools/venv/bin:$PATH
#export PATH=/project/nakamura-lab09/Work/yuka-ko/espnet-new/tools/venv/bin:$PATH



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/is/yuka-ko/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/is/yuka-ko/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/is/yuka-ko/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/is/yuka-ko/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

## alias

# ls
alias ls='ls -F'
alias sl='ls'
alias l='ls'
alias ss='ls'
alias ll='ls -l'
alias la='ls -la'

# tmux a
alias ta='tmux a'
alias nv='nvidia-smi'

# corpus
alias btec-ja='cd /project/nakamura-lab01/Share/Corpora/Speech/ja/BTEC/'
alias btec-en='cd /project/nakamura-lab01/Share/Corpora/Speech/en/BTEC/'

# espnet
alias home='cd /project/nakamura-lab09/Work/yuka-ko/'
alias os='cd /project/nakamura-lab09/Work/yuka-ko/osamura/pytorch/scripts/'
alias remov-at="sed -r 's/(@@ )|(@@ ?$)//g'"
alias csj='cd /project/nakamura-lab09/Work/yuka-ko/espnet/egs/csj/asr2/'
alias btec='cd /project/nakamura-lab09/Work/yuka-ko/espnet/egs/btec/st1'
alias btec-gtts='cd /project/nakamura-lab09/Work/yuka-ko/espnet/egs/btec-gtts/st1'
alias btec1='cd /project/nakamura-lab09/Work/yuka-ko/espnet/egs/btec1-fm/st1'
alias fisher='cd /project/nakamura-lab09/Work/yuka-ko/espnet/egs/fisher_callhome_spanish/st1/'
alias jesc='cd /project/nakamura-lab09/Work/yuka-ko/espnet/egs/jesc/mt1/'
alias mustc='cd /project/nakamura-lab09/Work/yuka-ko/espnet/egs/must_c/st1'
alias espnet='cd /project/nakamura-lab09/Work/yuka-ko/espnet/'
alias h='history'
alias ra='bash run.sh'
alias db='cd /project/nakamura-lab09/Work/yuka-ko/data-ko/db/btec/ja-en/BTEC1-natural/'
alias work3='cd /ahc/work3/yuka-ko/'
alias emo='cd /project/nakamura-lab09/Work/yuka-ko/distill-bert-for-seq2seq-asr/'
alias db='cd /project/nakamura-lab09/Work/yuka-ko/data-ko/db/btec/ja-en/'
# git
#alias g='git'
#alias ga='git add'
#alias gd='git diff'
#alias gs='git status'
#alias gp='git push'
#alias gst='git status'
#alias gc='git checkout'
#alias gf='git fetch'
#alias gco='git commit'

# vim
alias vi='vim'
alias v='vim'

# python
alias p='python'
alias venv='source /project/nakamura-lab09/Work/yuka-ko/espnet/tools/venv/bin/activate'


#alias venvn='source /project/nakamura-lab09/Work/yuka-ko/espnet-new/tools/venv/bin/activate'

#alias b='git branch'
#alias c='git checkout'
#alias s='git status'
#alias add='git add'
#alias commit='git commit -m'


cd -
#cd /project/nakamura-lab09/Work/yuka-ko/espnet/egs/btec/st1/
#cd /project/nakamura-lab09/Work/yuka-ko/espnet-new/egs/must_c/st1/
#cd /project/nakamura-lab09/Work/yuka-ko/espnet/egs/btec/st1/



#export PATH="/project/nakamura-lab09/Work/yuka-ko/espnet/tools/venv/bin:$PATH"
# for import modules in espnet 
export PYTHONPATH="/project/nakamura-lab09/Work/yuka-ko/espnet:$PYTHONPATH"

# git
source ~/.git-completion.bash
source ~/.git-prompt.sh

# ls
#export LSCOLORS=gxfxcxdxbxegedabagacad
#alias ls='ls --color=auto'
export LSCOLORS=xbfxcxdxbxegedabagacad
#mustc
venv
