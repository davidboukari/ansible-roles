# ansible-roles

Install some roles

## Install ansible

```bash
sudo yum install python3
python3 -m venv venv-ansible
source venv-ansible/bin/activate
pip install ansible

#Create a role
ansible-galaxy init roles/sudouser
ansible-playbook -e 'sudo_user=toto'  playbook.yml
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


## Troubleshooting

### vncserver error font path

* https://github.com/davidboukari/xorg-x11-vnc

```bash
yum install pixman pixman-devel libXfont
yum update libXfont
vncserver -geometry   -fp /etc/X11/fontpath.d
```

