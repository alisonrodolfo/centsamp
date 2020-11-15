# ----------------------------------
# Environment: Debian
# ----------------------------------
FROM        centos:7

LABEL       author="Alison Barreiro" maintainer="equipemasters@live.com"

ENV         DEBIAN_FRONTEND noninteractive

RUN     yum update -y && yum upgrade -y && yum clean all

RUN     yum  update -y \
        && yum install -y kernel-headers kernel-devel binutils \
        && yum install -y cpp gcc gcc-c++ make psmisc glibc-devel glibc.i686 glibc-devel.i686 \
        && yum install -y ncurses-devel libstdc++ libGL.so.1 libstdc++.i686 libXinerama.i686 libstdc++.so.6 libmysqlclient.so.18 \
        && yum install -y vim unzip wget perl tar curl openssl bzip2 mariadb-libs  \
        yum  update -y \
        && useradd -d /home/container -m container


RUN     rm /etc/localtime
RUN     ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
RUN     yum install -y tzdata
ENV     TZ America/Sao_Paulo

ENV         USER=container HOME=/home/container

WORKDIR    /home/container

USER     container

COPY     ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
