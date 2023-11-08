FROM ubuntu:20.04
ARG MY_UID
ARG MY_GID
ENV TZ=Asia/Hong_Kong DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y sudo wget git
RUN groupadd -g $MY_GID tuser \
    && useradd -m -u $MY_UID -g $MY_GID -G sudo -K HOME_MODE=0777 -s /bin/bash tuser \
    && cp /etc/skel/.bashrc /home/tuser \
    && cp /etc/skel/.profile /home/tuser \
    && (echo "tuser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/tuser)