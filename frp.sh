#!/bin/sh

# 將frp文件夾移動至/srv/
mv ~/frp-setup/frp /srv/

# 啟動frpc利用定義之frpc.ini
/srv/frp/frpc -c /srv/frp/frpc.ini

# 將frpc_22.conf移動至/etc/supervisor/conf.d
mv ~/frp-setup/frpc_22.conf /etc/supervisor/conf.d/

# 重啟supervisor
supervisorctl reload
