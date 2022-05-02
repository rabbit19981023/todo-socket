FROM node:lts AS vue

ARG NEOVIM_VERSION=v0.7.0
ARG NEOVIM_OS=nvim-linux64

# NeoVim Installation
RUN curl -OL https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/${NEOVIM_OS}.tar.gz
RUN tar -xzvf ./${NEOVIM_OS}.tar.gz
RUN cp -r ./${NEOVIM_OS}/* /usr/local
RUN chmod +x /usr/local/bin/nvim

# NeoVim Setup
RUN mkdir -p /root/.config/nvim
COPY ./neovim.config /root/.config/nvim/init.vim

# Vim-Plug Installation
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Vue3 CLI installation
RUN npm install -g @vue/cli
