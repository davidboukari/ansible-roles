# ansible-roles

Install some roles

## Configure ssh keys

### ssh-install-keys
```bash
#!/bin/bash

function usage(){
  echo "$0 <USER> <IP>"
}

if [ $# -lt 2 ];then
  usage
  exit 10
fi

USER=$1
IPDEST=$2
if [ "$USER" = "root" ];then
  home=/root
else
  home=/home/${USER}
fi

ssh-copy-id -i ~/.ssh/id_rsa.pub ${USER}@${IPDEST}
scp  ~/.ssh/id_rsa* root@${IPDEST}:/${home}/.ssh
```

## Install ansible

```bash
yum install -y python3
python3 -m venv venv-ansible
source venv-ansible/bin/activate
pip install ansible

# Create a role
ansible-galaxy init roles/sudouser

# Create a sudo user
ansible-playbook -e 'sudo_user=toto'  playbook.yml

# Patch podman 
ansible-galaxy -e 'podman_user=toto podman_group=toto' playbook.yml
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
    - patchcentos4podman
    - sudouser
    - repo
    - devuser
    - graphicuser
    - vncuser
    - myservice
```


## Troubleshooting

### vncserver error font path

* https://github.com/davidboukari/xorg-x11-vnc

```bash
yum install pixman pixman-devel libXfont
yum update libXfont
vncserver -geometry   -fp /etc/X11/fontpath.d
```

