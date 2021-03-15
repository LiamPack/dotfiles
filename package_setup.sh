#!/usr/bin/env bash
mkdir -p $HOME/bin

export PATH=$HOME/bin:$PATH

# good packages :)
sudo apt install -y \
     build-essential \
     clang-tools \
     vim \
     docker \
     wget \
     curl \
     autoconf \
     bash-completion \
     rsync \

# miniconda install
if [ ! -x "$(which conda)" ]; then
   cd /tmp \
       && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
       && bash Miniconda3-latest-Linux-x86_64.sh
fi

# rust install
#if [ ! -x "$(which cargo)" ]; then
#    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#fi

## quicklisp setup
# curl -O https://beta.quicklisp.org/quicklisp.lisp
# sbcl --load quicklisp.lisp

# julia install
if [ ! -x "$(which julia)" ] ; then
   cd /tmp/ \
       && wget https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.3-linux-x86_64.tar.gz \
       && tar -xvf julia-1.5.3-linux-x86_64.tar.gz \
       && mv julia-1.5.3 $HOME/
fi

# install emacs27
if [ ! -x "$(which emacs)" ] ; then
    cd /tmp/ \
        && git clone https://git.savannah.gnu.org/git/emacs.git \
        && cd emacs \
        && git checkout emacs-27 \
        && ./autogen.sh \
        && ./configure \
        && make \
        && sudo make install
fi

if [ ! -x "$(which rg)" ] ; then
    # ripgrep install
    cd /tmp \
       && curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb \
       && sudo dpkg -i ripgrep_12.1.1_amd64.deb \
       && sudo apt update \
       && sudo apt install ripgrep
fi

if [ ! -x "$(which racket)" ]; then
    sudo add-apt-repository ppa:plt/racket
    sudo apt update
    sudo apt install racket
fi
