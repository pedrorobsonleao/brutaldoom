FROM ubuntu:20.04

RUN \
    apt update -y && \
    apt install -y \
    wget \
    software-properties-common \
    &&\
    wget -O - http://debian.drdteam.org/drdteam.gpg | apt-key add - && \
    apt-add-repository -y 'deb http://debian.drdteam.org/ stable multiverse' && \
    apt install -y \
    bash \
    sudo \
    libgtk2.0-0 \
    # DOOM
    prboom-plus \
    freedoom \
    zandronum \
    doomseeker-zandronum && \
    apt-get install --no-install-recommends -y pulseaudio && \
    apt purge -y \
    wget \
    software-properties-common \
    && \
    apt autoremove -y && \
    apt autoclean -y && \
    rm -rf /var/lib/apt/lists/* && \
    # -- user information
    export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer
ADD . /

USER developer
ENV PULSE_SERVER=host.docker.internal
ENV HOME /home/developer
ENV PATH=$PATH:/usr/games

CMD ["/usr/bin/doomseeker"]