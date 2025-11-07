#!/usr/bin/env bash

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

