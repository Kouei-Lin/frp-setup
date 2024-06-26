# 1.簡介
簡易腳本來加速`Raspberry Pi` 的`FRP` 設置。

# 2.事前須知

### Raspberry Pi燒錄
前往[Raspberry Pi官網](https://www.raspberrypi.com/software/)下載軟體，並燒錄你的`Raspberry Pi`。
燒錄好後，啟動`Raspberry Pi`並將其連結網路。燒錄時請將`ssh`功能啟用，並記好帳密。

本腳本適用於`Raspberry Pi OS Lite (64-bit)`系統。

### FRP
本腳本使用之`FRP`源於[fatedier](https://github.com/fatedier//frp/releases/)的`v0.44.0 arm64`版本，此部份功勞全歸功於`fatedier`。

# 3.Raspberry Pi FRP設置

### Raspberry Pi 系統初始＆套件安裝
```
$ sudo apt update && apt upgrade
$ sudo apt install git
```

如有其他套件需求，可自行添加。

### 腳本下載 
```
$ git clone https://github.com/Kouei-Lin/frp-setup ~/frp-setup
```

### 伺服器和埠編輯
```
$ cd ~/frp-setup
$ vi frp.sh
```
於此編輯環境變數。

### 啟動腳本
```
$ chmod +x frp.sh
$ sudo ./frp.sh
```

# 4.測試FRP

### 連線測試
於另外一台電腦測試`ssh`連線。

```
$ ssh USER@SERVER_ADDR -p SERVER_PORT
```

- `USER` = `Raspberry Pi`登錄之帳戶名
- `SERVER_ADDR` = `frp.sh`自行編輯之`SERVER_ADDR`
- `SERVER_PORT` = `frp.sh`自行編輯之`REMOTE_PORT`

建議進行複數次連線測試，也推薦將`Raspberry Pi`關機重開機後進行測試確保`systemd`正常運作。
