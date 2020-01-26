# ansible-roles

Install some roles

## Install ansible

```bash
sudo yum install python3
python3 -m venv venv-ansible
source venv-ansible/bin/activate
pip install ansible
ansible-galaxy
```

## Install roles
ansible-playbook  -b -vvv  playbook.yml

```bash
cat playbook.yml
---
-
  vars:
  hosts: localhost
  roles:
    - repo
    - devuser
    - graphicuser
    - vncuser
    - myservice
```
