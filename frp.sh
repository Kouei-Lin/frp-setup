#!/bin/bash

configure_frp() {
    local FRP_VERSION="0.44.0"
    local FRP_ARCH="arm64"
    local SERVER_ADDR="SERVER_ADDR"
    local SERVER_PORT="SERVER_PORT"
    local ADMIN_ADDR="ADMIN_ADDR"
    local ADMIN_PORT="ADMIN_PORT"
    local SERVICE_NAME="SSH_SERVICE_NAME"
    local REMOTE_PORT="REMOTE_PORT"

    # 進/srv
    cd /srv && \
    # 下載FRP
    wget "https://github.com/fatedier/frp/releases/download/v$FRP_VERSION/frp_${FRP_VERSION}_linux_$FRP_ARCH.tar.gz" && \
    # 解tar
    tar xvzf "frp_${FRP_VERSION}_linux_$FRP_ARCH.tar.gz" && \
    # 更名
    mv "frp_${FRP_VERSION}_linux_$FRP_ARCH" frp && \

    # echo config 進 /srv/frp/frpc.ini
    echo "
    [common]
    server_addr = $SERVER_ADDR
    server_port = $SERVER_PORT
    admin_addr = $ADMIN_ADDR
    admin_port = $ADMIN_PORT

    [ssh_$SERVICE_NAME]
    type = tcp
    local_ip = 127.0.0.1
    local_port = 22
    remote_port = $REMOTE_PORT
    use_encryption = true
    use_compression = true
    " > /srv/frp/frpc.ini && \

    # systemd 服務設置
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

    # systemd 重啟
    sudo systemctl daemon-reload && \
    sudo systemctl enable frpc.service && \
    sudo systemctl start frpc.service
}

# 叫 function
configure_frp

