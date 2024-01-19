#!/bin/sh

# 將frp文件夾移動至/srv/
sudo cp -r ~/frp-setup/frp /srv/

# 啟動frpc利用定義之frpc.ini
sudo /srv/frp/frpc -c /srv/frp/frpc.ini

# 將frpc_22.conf移動至/etc/supervisor/conf.d
sudo cp ~/frp-setup/frpc_22.conf /etc/supervisor/conf.d/

# 重啟supervisor
sudo supervisorctl reload
