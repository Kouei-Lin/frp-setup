#!/bin/sh

# 進到/srv
cd /srv

# 取得frp v0.44.0
wget https://github.com/fatedier/frp/releases/download/v0.44.0/frp_0.44.0_linux_arm64.tar.gz

# 解tar
tar xvzf frp_0.44.0_linux_arm64.tar.gz

# 改名frp
mv frp_0.44.0_linux_arm64 frp

# 移動frpc.ini至frp
mv ~/frp-setup/frpc.ini /srv/frp/

# 啟動frpc利用定義之frpc.ini
/srv/frp/frpc -c frpc.ini

# 將frpc_22.conf移動至/etc/supervisor/conf.d
mv ~/frp-setup/frpc_22.conf /etc/supervisor/conf.d/

# 重啟supervisor
supervisorctl reload
