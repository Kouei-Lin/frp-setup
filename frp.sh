#!/bin/bash

# Set frp version and architecture variables
FRP_VERSION="0.44.0"
FRP_ARCH="arm64"

# Move to /srv
cd /srv && \
# Download frp with dynamic version and architecture
wget "https://github.com/fatedier/frp/releases/download/v$FRP_VERSION/frp_${FRP_VERSION}_linux_$FRP_ARCH.tar.gz
" && \
# Extract the tar file
tar xvzf "frp_${FRP_VERSION}_linux_$FRP_ARCH.tar.gz" && \
# Rename the extracted directory to 'frp'
mv "frp_${FRP_VERSION}_linux_$FRP_ARCH" frp && \

# Echo frpc.ini configuration to /srv/frp/frpc.ini
echo "
[common]
server_addr = SERVER_ADDR_!!
server_port = SERVER_PORT_!!
admin_addr = ADMIN_ADDR_!!
admin_port = ADMIN_PORT_!!

[ssh_SERVICE_NAME_!!]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = REMOTE_PORT_!!
use_encryption = true
use_compression = true
" > /srv/frp/frpc.ini && \

# systemd service
echo "
[Unit]
Description=frp client service

[Service]
ExecStart=/bin/bash -c 'cd /srv/frp && /srv/frp/frpc -c frpc.ini'
WorkingDirectory=/srv/frp
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
" | sudo tee /etc/systemd/system/frpc.service && \

# systemd
sudo systemctl daemon-reload && \
sudo systemctl enable frpc.service && \
sudo systemctl start frpc.service
