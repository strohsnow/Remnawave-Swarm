#!/usr/bin/env bash

sudo install -d -m 755 /var/log/remnanode

sudo install -d -m 755 /etc/logrotate.d
sudo tee /etc/logrotate.d/remnanode > /dev/null << "EOF"
/var/log/remnanode/*.log {
  size 50M
  rotate 5
  compress
  missingok
  notifempty
  copytruncate
}
EOF

