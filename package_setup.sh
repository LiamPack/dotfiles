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
     cmake \
     autoconf \
     sbcl \
     chezscheme \
     bash-completion \
     rsync \
     nodejs \
     npm \
     texlive \
     texinfo \
     fd-find \
     tmux \
     ripgrep

# miniconda install
if [ ! -x "$(which conda)" ]; then
    cd /tmp \
        && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
        && bash Miniconda3-latest-Linux-x86_64.sh
fi

# rust install
if [ ! -x "$(which cargo)" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

## quicklisp setup
# curl -O https://beta.quicklisp.org/quicklisp.lisp
# sbcl --load quicklisp.lisp

# julia install
if [ ! -x "$(which julia)" ] ; then
    cd /tmp/ \
        && wget https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.3-linux-x86_64.tar.gz \
        && tar -xvf julia-1.5.3-linux-x86_64.tar.gz \
        && mv julia-1.5.3 $HOME/ \
	&& ln -s $HOME/julia-1.5.3/bin/julia $HOME/bin/julia
fi

# install emacs27
if [ ! -x "$(which emacs)" ] ; then
    sudo apt install -y autoconf automake autotools-dev bsd-mailx build-essential \
            diffstat gnutls-dev imagemagick libasound2-dev libc6-dev libdatrie-dev \
                libdbus-1-dev libgconf2-dev libgif-dev libgnutls28-dev libgpm-dev libgtk2.0-dev \
                    libgtk-3-dev libice-dev libjpeg-dev liblockfile-dev liblqr-1-0 libm17n-dev \
                        libmagickwand-dev libncurses5-dev libncurses-dev libotf-dev libpng-dev \
                            librsvg2-dev libsm-dev libthai-dev libtiff5-dev libtiff-dev libtinfo-dev libtool \
                                libx11-dev libxext-dev libxi-dev libxml2-dev libxmu-dev libxmuu-dev libxpm-dev \
                                    libxrandr-dev libxt-dev libxtst-dev libxv-dev quilt sharutils texinfo xaw3dg \
                                        xaw3dg-dev xorg-dev xutils-dev zlib1g-dev libjansson-dev libxaw7-dev \
                                            libselinux1-dev libmagick++-dev libacl1-dev gir1.2-javascriptcoregtk-4.0 \
                                                gir1.2-webkit2-4.0 libenchant1c2a libglvnd-core-dev libicu-le-hb-dev \
                                                    libidn2-0-dev libjavascriptcoregtk-4.0-dev liboss4-salsa2 libsoup2.4-dev \
                                                        libsystemd-dev libwebkit2gtk-4.0-dev libx11-xcb-dev libxcb-dri2-0-dev \
                                                            libxcb-dri3-dev libxcb-glx0-dev libxcb-present-dev libxshmfence-dev \
                                                                x11proto-composite-dev x11proto-core-dev x11proto-damage-dev \
                                                                    x11proto-fixes-dev

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
