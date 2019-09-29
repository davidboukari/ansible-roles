#!/bin/bash 

CMDNAME=`basename $0`
ROLES=""

function usage()
{
  echo -e "${CMDNAME} <rolename>
${CMDNAME} nginx  
"  
}

if [ $# -lt 1 ];then 
  usage
  exit 3
fi

ROLES="$1"
WORKDIR=roles/${ROLES}

mkdir -p ${WORKDIR} 
mkdir -p ${WORKDIR}/{defaults,handlers,meta,tasks,files,templates,tests,vars}

touch ${WORKDIR}/files/myfile.txt
touch ${WORKDIR}/defaults/main.yml 
touch ${WORKDIR}/handlers/main.yml
touch ${WORKDIR}/meta/main.yml
touch ${WORKDIR}/tasks/main.yml 
touch ${WORKDIR}/tests/inventory
touch ${WORKDIR}/tests/test.yml
touch ${WORKDIR}/templates/inventory
touch ${WORKDIR}/templates/mytemplate.yml
touch ${WORKDIR}/vars/main.yml


echo "A simple file" >>  ${WORKDIR}/files/myfile.txt

echo -e "- name: Reload Firewall
  service:
    name: firewalld
    state: reloaded
" > ${WORKDIR}/handlers/main.yml

echo -e "galaxy_info:
  author: your name
  description: your description
  company: your company (optional)
  license: license (GPLv2, CC-BY, etc)
  min_ansible_version: 1.2
  galaxy_tags: []
dependencies: []" > ${WORKDIR}/meta/main.yml

echo -e "---" > ${WORKDIR}/tasks/main.yml

echo "localhost" > ${WORKDIR}/tests/inventory

echo -e "---
- hosts: localhost
  remote_user: root
  roles:" > ${WORKDIR}/tests/test.yml



