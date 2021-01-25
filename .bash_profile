if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
#export PATH="$HOME/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
export PATH="/home/is/yuka-ko/.pyenv/bin:$PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${HOME}/tools/lib # libeventなどの共有ライブラリへのパスを通す
export PATH=$PATH:/home/is/yuka-ko/tools/bin #ローカルにインストールしたパッケージへパスを通す

<<COMMENTOUT
CUDAROOT=/usr/local/cuda
export PATH=$CUDAROOT/bin:$PATH
export LD_LIBRARY_PATH=$CUDAROOT/lib64:$LD_LIBRARY_PATH
export CFLAGS="-I$CUDAROOT/include $CFLAGS"
export CPATH=$CUDAROOT/include:$CPATH
export CUDA_HOME=$CUDAROOT
export CUDA_PATH=$CUDAROOT
COMMENTOUT

export PATH="${TOOL_DIR}"/sph2pipe_v2.5:"${PATH:-}"
export PATH="${TOOL_DIR}"/sctk-2.4.10/bin:"${PATH:-}"
export PATH="${TOOL_DIR}"/mwerSegmenter:"${PATH:-}"
export PATH="${TOOL_DIR}"/moses/scripts/tokenizer:"${TOOL_DIR}"/moses/scripts/generic:"${TOOL_DIR}"/tools/moses/scripts/recaser/:"${TOOL_DIR}"/moses/scripts/training/"${PATH:-}"
export PATH="${TOOL_DIR}"/nkf/nkf-2.1.4:"${PATH:-}"
export PATH="${TOOL_DIR}"/PESQ/P862_annex_A_2005_CD/source:"${PATH:-}"
export PATH="${TOOL_DIR}"/kenlm/build/bin:"${PATH:-}"
export LD_LIBRARY_PATH="${TOOL_DIR}"/lib:"${TOOL_DIR}"/lib64:"${LD_LIBRARY_PATH:-}"
export PATH="${KALDI_TOOL_DIR}"/sph2pipe_v2.5:"${PATH:-}"
export PATH="${KALDI_TOOL_DIR}"/sctk-2.4.10/bin:"${PATH:-}"
export PATH="${KALDI_TOOL_DIR}"/mwerSegmenter:"${PATH:-}"
export PATH="${KALDI_TOOL_DIR}"/moses/scripts/tokenizer:"${KALDI_TOOL_DIR}"/moses/scripts/generic:"${KALDI_TOOL_DIR}"/tools/moses/scripts/recaser/:"${KALDI_TOOL_DIR}"/moses/scripts/training/"${PATH:-}"
export PATH="${KALDI_TOOL_DIR}"/nkf/nkf-2.1.4:"${PATH:-}"
export PATH="${KALDI_TOOL_DIR}"/PESQ/P862_annex_A_2005_CD/source:"${PATH:-}"
export PATH="${KALDI_TOOL_DIR}"/kenlm/build/bin:"${PATH:-}"
export LD_LIBRARY_PATH="${KALDI_TOOL_DIR}"/lib:"${KALDI_TOOL_DIR}"/lib64:"${LD_LIBRARY_PATH:-}"

export TERM="xterm-256color"
