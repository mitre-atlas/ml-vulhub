FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
	curl \
	git \
	iproute2 \ 
	nmap \
	&& rm -rf /var/lib/apt/lists/*

ARG USER=mldev
RUN useradd -d /home/$USER -m -s/bin/bash $USER
RUN usermod -aG sudo $USER
USER $USER
WORKDIR /home/$USER

RUN curl https://dl.min.io/client/mc/release/linux-amd64/mc \
		--create-dirs \
	    -o $HOME/minio-binaries/mc && \
	chmod +x $HOME/minio-binaries/mc && \
	echo "PATH=$PATH:$HOME/minio-binaries/" >> $HOME/.bashrc && \
	$HOME/minio-binaries/mc ls

ADD mc-config.json /home/$USER/.mc/config.json

ENTRYPOINT /bin/bash
