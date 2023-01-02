FROM ubuntu:latest AS core

SHELL ["/bin/bash", "-c", "-o", "pipefail"]

ENV TZ=Europe/Stockholm
ENV DEBIAN_FRONTEND=noninteractive

RUN useradd -g users -m -d /home/neovim -s /bin/bash neovim

# Install tooling
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    libreadline-dev \
    unzip \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install node lts
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install nodejs -y

# Install python3.11
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
    python3.11 \
    python3.11-dev \
    python3.11-venv \
    python3.11-distutils \
    && rm -rf /var/lib/apt/lists/*

# Install neovim
RUN wget -qO- https://github.com/neovim/neovim/releases/download/v0.8.1/nvim-linux64.deb > nvim.deb && \
    dpkg -i nvim.deb && \
    rm nvim.deb

# Install terminal tools
RUN apt-get update && apt-get install -y \
    fd-find \
    luarocks \
    fzf \
    ripgrep \
    tmux \
    zsh \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g \
    neovim \
    tree-sitter-cli \
    editorconfig-cli

######################################################################

FROM core AS nvim_image

USER neovim
WORKDIR /home/neovim/.config/nvim
RUN mkdir -p .config/nvim

# Set up virutalenv for neovims python provider
COPY ./requirements.txt ./requirements.txt
RUN python3.11 -m ensurepip && \
    python3.11 -m venv nvim-venv && \
    source nvim-venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy over lua files
COPY init.lua init.lua
COPY ./lua ./lua

# Install Packer packages
RUN nvim \
    --headless \
    -c 'autocmd User PackerComplete quitall' \
    -c 'PackerSync'

# Workaround for some limit on number of packages to restore during PackerSync.
# TODO, figure out who I need this.
RUN nvim \
    --headless \
    -c 'autocmd User PackerComplete quitall' \
    -c 'PackerSync'
    
RUN nvim --headless -c "MasonInstallAll"

RUN git clone https://github.com/zsh-users/antigen.git /home/neovim/GitHub/antigen

ENV CUSTOM_CONFIG_DIR=/home/neovim/GitHub/dotfiles
RUN git clone https://github.com/jensjensjens/dotfiles.git $CUSTOM_CONFIG_DIR && \
    echo "source $CUSTOM_CONFIG_DIR/zsh_init.sh" >> ~/.zshrc

# Copy over tmux config
WORKDIR /home/neovim
COPY .tmux.conf .tmux.conf

ENV DEBIAN_FRONTEND=""
ENV TERM=xterm-256color

WORKDIR /home/neovim/workspace

ENTRYPOINT [ "tmux" ]
