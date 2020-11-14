# ----------------------------------
# Environment: Debian
# ----------------------------------
FROM        centos:7

LABEL       author="Alison Barreiro" maintainer="equipemasters@live.com"

ENV         DEBIAN_FRONTEND noninteractive

RUN     yum update -y && yum upgrade -y && yum clean all

RUN     yum  update -y \
        && yum  install -y binutils cpp gcc make psmisc glibc-devel glibc-devel.i686 ncurses-devel libstdc++ libstdc++.i686 vim unzip wget perl tar curl openssl mariadb-libs  \
        && useradd -d /home/container -m container

RUN     ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
RUN     yum install -y tzdata
RUN     timedatectl set-timezone America/Sao_Paulo

ENV         USER=container HOME=/home/container

WORKDIR    /home/container

USER     container

COPY     ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
