#!/bin/sh

# Ananconda:
wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh \
&& bash Anaconda3-2023.09-0-Linux-x86_64.sh -b
# Miniconda:
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
&& bash Miniconda3-latest-Linux-x86_64.sh -b -u -p ~/miniconda3 \
&& ~/miniconda3/bin/conda init bash
# pytorch:
conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia