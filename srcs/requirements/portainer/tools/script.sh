#!/bin/bash

exec ./portainer/portainer \
  --bind 0.0.0.0:9000 \
  --data /data
  --admin-password ${portainer_admin_pwd}