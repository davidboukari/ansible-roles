# ansible-roles

Install some roles

## Configure ssh keys

```bash
IPDEST=192...
USER=root
ssh-copy-id -i ~/.ssh/id_rsa.pub ${USER}@${IP}
scp -i ~/.ssh/id_rsa* root@${IP}:/root/.ssh
```

## Install ansible

```bash
yum install python3
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

