#!/bin/bash
echo "****************************************"
echo " Setting up Capstone Environment"
echo "****************************************"

sudo apt-get update
echo "Installing Python 3.8 Virtual Environment"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y python3.10-venv

echo "Making Python 3.8 the default..."
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1



echo "Checking the Python version..."
python3 --version

echo "Creating a Python virtual environment"
python3 -m venv ~/backend-songs-venv

echo "Configuring the developer environment..."
echo "# Backend Capstone Project additions" >> ~/.bashrc
echo "export GITHUB_ACCOUNT=$GITHUB_ACCOUNT" >> ~/.bashrc
echo 'export PS1="\[\e]0;\u:\W\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "' >> ~/.bashrc

echo "Installing Python depenencies..."
source ~/backend-songs-venv/bin/activate && python3 -m pip install --upgrade pip wheel
source ~/backend-songs-venv/bin/activate && pip install -r requirements.txt
echo "source ~/backend-songs-venv/bin/activate" >> ~/.bashrc

echo "****************************************"
echo " Capstone Environment Setup Complete"
echo "****************************************"
echo ""
echo "Use 'exit' to close this terminal and open a new one to initialize the environment"
echo ""
