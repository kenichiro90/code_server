FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive && apt-get install -y \
    ca-certificates \
    gnome-keyring \
    libc6 \
    libstdc++6 \
    openssh-server \
    python3-minimal \
    tar \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O- https://aka.ms/install-vscode-server/setup.sh | sh

WORKDIR /root
CMD [ "code-server", "--accept-server-license-terms", "serve-local", "--host", "0.0.0.0"]