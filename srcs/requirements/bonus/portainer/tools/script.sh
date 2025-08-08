#!/bin/bash


hashed_password=$(htpasswd -bnB "" ${portainer_admin_pwd} | tr -d ':\n')


exec ./portainer/portainer \
  --bind 0.0.0.0:9000 \
  --data /data \
  --admin-password ${hashed_password}