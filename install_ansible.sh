#!/bin/bash 

sudo yum install python3 -y
python3 -m venv ../venv-ansible
source ../venv-ansible/bin/activate
pip install ansible
ansible-galaxy --help

echo -e "

===============================================
Now activate the python venv like that: 
source ../venv-ansible/bin/activate
===============================================
"
