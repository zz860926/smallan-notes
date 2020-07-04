## [ubuntu 16.04 設定固定IP](https://www.albert-yu.com/2018/01/ubuntu-16-04-%E8%A8%AD%E5%AE%9A%E5%9B%BA%E5%AE%9Aip/)
1.修改 Ethernet 網路設定
```
vim /etc/network/interfaces
auto lo
iface lo inet loopback# The primary network interface
auto ens160
iface ens160 inet static # 固定 (靜態) IP
address 10.159.xx.xx # IP 位址
netmask 255.255.255.0 # 網路遮罩
gateway 10.159.xx.xx # 預設閘道
dns-nameservers 168.95.1.1 #DNS第一組
dns-nameservers 8.8.8.8 #DNS第二組
```
2. 修改完可使用以下指令重新啟動網路讀取網路設定
```
root@management:~# /etc/init.d/networking restart
[ ok ] Restarting networking (via systemctl): networking.service.
```