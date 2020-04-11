FROM stasuwe/linuxgsm:1.0
LABEL maintainer="@stasuwe"

USER root

## Install cssserver dependencies
RUN echo steam steam/question select "I AGREE" | debconf-set-selections
RUN dpkg --add-architecture i386 && \
	apt update -y && \
	apt install -y \
    tar \
    lib32stdc++6 \
    netcat \
    steamcmd \
		&& apt-get clean \
	  && rm -rf /var/lib/apt/lists/*

USER linuxgsm
WORKDIR /home/linuxgsm
ENV TERM=xterm
