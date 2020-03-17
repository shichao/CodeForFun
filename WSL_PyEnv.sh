#!/bin/bash -i
# This script if for Ubuntu 18.04
# Register MS key and feed
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

# Update apt
sudo add-apt-repository universe
sudo apt update

# Install required packages and tools
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git python-pip \
apt-transport-https \
# dotnet-sdk-2.1 dotnet-sdk-3.1

# Install pyenv
curl https://pyenv.run | bash
echo '# pyenv' >> ~/.bashrc
echo "export PATH=\"${HOME}/.pyenv/bin:\$PATH\"" >> ~/.bashrc
echo "eval \"\$(pyenv init - --no-rehash)\"" >> ~/.bashrc
echo "eval \"\$(pyenv virtualenv-init -)\"" >> ~/.bashrc
source ~/.bashrc

# Install pyenv virtual env wrapper
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper
echo 'pyenv virtualenvwrapper_lazy' >> ~/.bashrc
source ~/.bashrc

# Install python 3
pyenv install 3.7.2
pyenv global 3.7.2

# Update pip
pip install --upgrade pip

# Install pipenv
pip install --upgrade pipenv
echo '# pipenv' >> ~/.bashrc
echo 'eval "$(pipenv --completion)"' >> ~/.bashrc
source ~/.bashrc

# Create env for jupyter3
pyenv virtualenv 3.7.2 jupyter3
# Switch to the env
export PYENV_VERSION=jupyter3
pip install --upgrade jupyter jupyterlab numpy scipy sklearn matplotlib ipython pandas sympy nose
python -m ipykernel install --user
pip install ipywidgets
jupyter nbextension enable --py widgetsnbextension --sys-prefix
# Switch back
unset PYENV_VERSION

# Ipython profile
pyenv global 3.7.2 jupyter3
ipython profile create
curl -L http://hbn.link/hb-ipython-startup-script > ~/.ipython/profile_default/startup/00-venv-sitepackages.py
source ~/.bashrc

# Install .net kernel
# dotnet tool install --global dotnet-try
# source ~/.bashrc
# dotnet try jupyter install
# jupyter kernelspec list

