mv frp /srv/
cd ~/frp-setup/
mv frpc_22.conf /etc/supervisor/conf.d/
supervisorctl reload
