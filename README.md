# ansible-roles

Install some roles

## Ansible Roles

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
