FROM ubuntu:latest

SHELL ["/bin/bash", "-c"]

WORKDIR /app
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libreadline-dev \
    unzip \
    software-properties-common && \
    add-apt-repository ppa:neovim-ppa/stable -y && \
    apt-get update

RUN apt-get install --no-install-recommends -y \
    curl  \
    fd-find \
    neovim \
    python3.11\
    python3.11-venv \
    nodejs \
    luajit \
    npm \
    fzf \
    ripgrep

RUN curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz && \
    tar -zxf lua-5.3.5.tar.gz && \
    cd lua-5.3.5 && \
    make linux test && \
    make install

RUN python3.11 -m venv /root/.config/nvim/nvim-venv && \
    source /root/.config/nvim/nvim-venv/bin/activate && \
    pip3 install --upgrade pip && \
    pip3 install neovim pynvim

RUN npm install -g neovim

RUN mkdir -p /root/.config/nvim
COPY . /root/.config/nvim

RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

ENV LANG="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"
ENV LC_CTYPE="en_US.UTF-8"

ENTRYPOINT [ "nvim" ]
