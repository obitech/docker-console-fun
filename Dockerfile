FROM debian:stretch-slim

# Skip choosing keyboard layout
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    sl \
    fortune \
    cowsay \
    lolcat \
    toilet \
    figlet \
    cmatrix \
    bb \
    wget \
    curl \
    tar \
    libaa-bin \
    libcurses-perl \
    make \
    python \
    python3 \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py \
    && pip3 install sh \
    && cd /tmp && wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.4.tar.gz \
    && tar -zxvf Term-Animation-2.4.tar.gz \
    && cd Term-Animation-2.4/ \
    && perl Makefile.PL && make && make test && make install \
    && cd /tmp && wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz \
    && tar -zxvf asciiquarium.tar.gz \
    && cd asciiquarium_1.1/ \
    && cp asciiquarium /usr/local/bin \
    && chmod 0755 /usr/local/bin/asciiquarium \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/games:${PATH}"

CMD sh