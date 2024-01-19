# 1.簡介
簡易腳本來加速Rasberry Pi 的FRP 設置。

# 2.Repo架構
```
├── README.md
├── frp
│   ├── LICENSE
│   ├── frpc
│   ├── frpc.ini
│   ├── frpc_full.ini
│   ├── frps
│   ├── frps.ini
│   └── frps_full.ini
├── frp.sh
└── frpc_22.conf
```

# 3.事前須知

### Rasberry Pi燒錄
前往[Rasberry Pi官網](https://www.raspberrypi.com/software/)下載軟體，並燒錄你的`Rasberry Pi`。
燒錄好後，啟動`Rasberry Pi`並將其連結網路。燒錄時請將`ssh`功能啟用，並記好帳密。

本腳本適用於`Rasberry Pi OS Lite (64-bit)`系統。

### FRP
本腳本使用之`FRP`源於[fatedier](https://github.com/fatedier//frp/releases/)的`v0.44.0`版本，此部份功勞全歸功於`fatedier`。

# 4.Rasberry Pi FRP設置

### Rasberry Pi 系統初始＆套件安裝
`sudo apt update && sudo apt upgrade`套件系統更新。

`sudo apt install git wget supervisor`套件安裝，如果有其他套件需求，如編輯器，請於此添加安裝。

### 腳本下載 
`cd ~`回主目錄。

`su`切換`root`。

`git clone https://github.com/Kouei-Lin/frp-setup`取得腳本。

### 伺服器和埠編輯
`cd frp-setup/frp`進入`frp`。

`vi frpc.ini`編輯有`!!`的部份，其中包含伺服器和埠等資訊。

`cd ~/frp-setup`回到`frp-setup`文件夾。

### 啟動腳本
`chmod +x frp.sh`開啟腳本權限。

`./frp.sh`啟動腳本。

# 5.測試FRP

### 連線測試
`ssh USER_!!@SERVER_ADDR_!! -p SERVER_PORT_!!`於另一台機器進行連線測試。

- USER_!! = 伺服器登錄之帳戶名
- SERVER_ADDR_!! = `frpc.ini`自行編輯之`SERVER_ADDR_!!`
- SERVER_PORT_!! = `frpc.ini`自行編輯之`SERVER_PORT_!!`

建議進行複數次連線測試，也推薦將`Rasberry Pi`關機重開機後進行測試確保`supervisor`正常運作。
