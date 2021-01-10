FROM ubuntu:bionic

RUN apt-get update
RUN apt-get install -y \
    software-properties-common \
    rxvt-unicode-256color xauth \
    x11-xserver-utils \
    git \
    curl \
    xinit fontconfig \
    xfce4-terminal \
    neovim \
    zsh \
    locales \
    x11-utils \
    man && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# copy dotfiles
COPY .Xresources /root/.Xresources
COPY .vimrc /root/.vimrc

# symlink vim with neovim
RUN cd /root && \
	mkdir -p .config/nvim && \
	ln -s /root/.vimrc /root/.config/nvim/init.vim && \ 
    curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# attempt to install plugings on build
# RUN nvim +PlugInstall +qa > /dev/null

COPY envypn-font-1.7.1.tar.gz /tmp/envypn-font-1.7.1.tar.gz

RUN rm /etc/fonts/conf.d/70-no-bitmaps.conf && \
	cd /tmp && \
	tar xvzf envypn-font-1.7.1.tar.gz && \
	cd envypn-font-1.7.1 && \
	sh envypn-install.sh

COPY entrypoint.sh /usr/local/bin/

ENV DISPLAY=host.docker.internal:0.0

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["urxvt", "-e", "zsh"]
