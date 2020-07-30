#!/bin/bash -i
# This script if for Ubuntu 20.04
# Register MS key and feed
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

# Update apt
sudo add-apt-repository universe
sudo apt update

# Install required packages and tools
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python-openssl \
git python3-pip mc \
# dotnet-sdk-2.1 dotnet-sdk-3.1

# Install pyenv
curl https://pyenv.run | bash
echo '# pyenv' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
source ~/.bashrc

# Install python 3
pyenv install 3.8.2
pyenv global 3.8.2

# Update pip
pip install --upgrade pip
pip install --upgrade pipenv

# Install virtuanenv plugin
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo -e 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc

# Create env for jupyter3
pyenv virtualenv 3.8.2 jupyter3

# Switch to the env
export PYENV_VERSION=jupyter3
pip install --upgrade pip
pip install --upgrade jupyter jupyterlab numpy scipy sklearn matplotlib ipython pandas sympy nose
python -m ipykernel install --user
pip install ipywidgets
jupyter nbextension enable --py widgetsnbextension --sys-prefix

# Switch back
unset PYENV_VERSION

# Ipython profile
pyenv global 3.8.2 jupyter3
ipython profile create
curl -L http://hbn.link/hb-ipython-startup-script > ~/.ipython/profile_default/startup/00-venv-sitepackages.py
source ~/.bashrc

# Install .net kernel
# dotnet tool install --global dotnet-try
# source ~/.bashrc
# dotnet try jupyter install
# jupyter kernelspec list