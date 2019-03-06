sudo apt-get update
# Install required packages and tools
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
# Install pyenv
curl https://pyenv.run | bash
echo '# pyenv' >> ~/.bashrc
echo "export PATH=\"${PYENV_ROOT}/bin:\$PATH\"" >> ~/.bashrc
echo "eval \"\$(pyenv init -)\"" >> ~/.bashrc
echo "eval \"\$(pyenv virtualenv-init -)\"" >> ~/.bashrc
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper
source ~/.bashrc

# Install python 3
pyenv install 3.7.2
pyenv global 3.7.2
# Update pip
pip install --upgrade pip
# Install pipenv
pip install pipenv
echo '# pipenv' >> ~/.bashrc
echo 'eval "$(pipenv --completion)"' >> ~/.bashr
source ~/.bashrc
# Create env for jupyter3
pyenv virtualenv 3.7.2 jupyter3
pyenv activate jupyter3
pip install jupyter
pip install jupyterlab
python -m ipykernel install --user
pip install ipywidgets
jupyter nbextension enable --py widgetsnbextension --sys-prefix
pyenv deactivate