#!/bin/bash -i
# This script if for Ubuntu 20.04
# Add alias for python and pip
echo 'alias python=python3' >> ~/.bash_aliases
echo 'alias pip=pip3' >> ~/.bash_aliases

# Register MS key and feed
sudo wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

# Update apt
sudo apt update

# Install required packages and tools
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python-openssl \
git python3-pip mc \
dotnet-sdk-2.1 dotnet-sdk-3.1

# Install miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
eval "$($HOME/miniconda/bin/conda shell.bash hook)"
conda init
conda config --set auto_activate_base false
source ~/.bashrc

# Setup a jupyterlab env
conda update -y -q -n base -c defaults conda
conda create -y --name jupyter
conda activate jupyter
conda install -y -c conda-forge jupyterlab
conda deactivate
source ~/.bashrc
