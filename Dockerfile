FROM ubuntu:bionic

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y rxvt-unicode-256color xauth
RUN apt-get install -y x11-xserver-utils
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y xinit fontconfig
RUN apt-get install -y xfce4-terminal
RUN apt-get install -y neovim
RUN apt-get install -y zsh
RUN apt-get install -y locales
RUN apt-get install -y x11-utils

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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
	ln -s /root/.vimrc /root/.config/nvim/init.vim

RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# RUN nvim +PlugInstall +qa > /dev/null

COPY envypn-font-1.7.1.tar.gz /tmp/envypn-font-1.7.1.tar.gz

ENV DISPLAY=host.docker.internal:0.0

RUN rm /etc/fonts/conf.d/70-no-bitmaps.conf && \
	cd /tmp && \
	tar xvzf envypn-font-1.7.1.tar.gz && \
	cd envypn-font-1.7.1 && \
	sh envypn-install.sh

RUN chsh -s /bin/zsh
RUN xrdb /root/.Xresources

CMD ["urxvt", "-e", "zsh"]