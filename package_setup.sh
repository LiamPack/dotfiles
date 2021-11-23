#!/usr/bin/env bash
mkdir -p $HOME/bin

export PATH=$HOME/bin:$PATH

# good packages :)
sudo apt install -y \
     build-essential \
     texinfo \
     clang-tools \
     vim \
     docker \
     wget \
     curl \
     autoconf \
     bash-completion \
     rsync \
     tmux \
     tree \
     htop \
     git \
     i3 \
     redshift \
     graphviz

# miniconda install
# if [ ! -x "$(which conda)" ]; then
#    cd /tmp \
    #        && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    #        && bash Miniconda3-latest-Linux-x86_64.sh
# fi

## quicklisp setup
# curl -O https://beta.quicklisp.org/quicklisp.lisp
# sbcl --load quicklisp.lisp

# julia install
# if [ ! -x "$(which julia)" ] ; then
#    cd /tmp/ \
    #        && wget https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.3-linux-x86_64.tar.gz \
    #        && tar -xvf julia-1.5.3-linux-x86_64.tar.gz \
    #        && mv julia-1.5.3 $HOME/
# fi

# install emacs28
if [ ! -x "$(which emacs)" ] ; then
    sudo apt install -Y libgnutls28-dev libtiff-dev libjpeg-dev libgif-dev libgccjit-10-dev libxpm-dev libpng-dev libxml2-dev;
    cd /tmp/ \
        && git clone https://github.com/emacs-mirror/emacs.git \
        && cd emacs \
        && git checkout emacs-28 \
        && CFLAGS="-I/usr/lib/gcc/x86_64-linux/10/"\
        && LDFLAGS="-L/usr/lib/x86_64-linux" \
        && ./autogen.sh \
        && ./configure --with-no-titlebar --with-x-toolkit=yes --with-native-compilation\
        && make -j8\
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

# akku install
if [ "" ] ; then
    sudo apt install -Y guile-3.0 guile-3.0-dev guile-3.0-libs libcurl-dev
    cd /tmp/\
        && wget https://gitlab.com/akkuscm/akku/uploads/819fd1f988c6af5e7df0dfa70aa3d3fe/akku-1.1.0.tar.gz\
        && tar -xvf akku-1.1.0.tar.gz\
        && cd akku-1.1.0 \
        && ./configure \
        && make -j8 \
        && sudo make install
fi

if [ "" ]; then
    cd /tmp/ \
        && git clone https://github.com/cisco/ChezScheme.git
            && ./configure && sudo make install -j4
fi
