#!/bin/sh

# This script is used to ensure `sudo` can be properly used by normal user \
# in `userns-remap` enabled Docker.
# Execute only once after container is built.

# 1. find <container_name> by:
#   docker ps
# 2. attach to it as root:
#   docker exec -it <container_name> bash
# 3. execute the following:
chown -R root:root /usr/bin/sudo /usr/lib/sudo/sudoers.so /etc/sudoers* \
&& chown -R tuser:tuser /home/tuser \
&& chmod 4755 /usr/bin/sudo
# 4. should be able to `sudo` without password in container now.

# (optional) install Ananconda as tuser:
wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh \
&& bash Anaconda3-2023.09-0-Linux-x86_64.sh -b
