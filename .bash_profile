if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
#export PATH="$HOME/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
export PATH="/home/is/yuka-ko/.pyenv/bin:$PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${HOME}/tools/lib # libeventなどの共有ライブラリへのパスを通す
export PATH=$PATH:/home/is/yuka-ko/tools/bin #ローカルにインストールしたパッケージへパスを通す
#CUDAROOT=/path/to/cuda
<<COMMENTOUT
CUDAROOT=/usr/local/cuda
export PATH=$CUDAROOT/bin:$PATH
export LD_LIBRARY_PATH=$CUDAROOT/lib64:$LD_LIBRARY_PATH
export CFLAGS="-I$CUDAROOT/include $CFLAGS"
export CPATH=$CUDAROOT/include:$CPATH
export CUDA_HOME=$CUDAROOT
export CUDA_PATH=$CUDAROOT
COMMENTOUT
# export KALDI_ROOT=/home/is/yuka-ko/kaldi
