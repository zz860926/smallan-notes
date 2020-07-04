# mininet docker
mininet 建立的虛擬機都會共用檔案，對於網路實驗還是有引響，所以結合docker能建立起完全隔離的環境
## 實驗拓譜
利用之前的[20200309router](20200309router.md)
<img src="image/20200309router.PNG" width=400></img>
```
#!/usr/bin/env python

from mininet.cli import CLI
from containernet.net import Containernet
from mininet.link import Link,TCLink,Intf

if '__main__' == __name__: 

  net = Containernet(link=TCLink)

  h1 = net.addHost('h1')
  h2 = net.addHost('h2')
  h3=net.addDocker('h3', dimage="ubuntu:trusty")

  #Link(h1, h2)

  #Link(h2, h3)
  linkopts1={'bw':10, 'loss':0, 'delay':'2ms'}
  linkopts2={'bw':1, 'loss':0, 'delay':'2ms'}
  net.addLink(h1, h2, cls=TCLink, **linkopts1)
  net.addLink(h2, h3, cls=TCLink, **linkopts2)

  net.build()

  h2.cmd('ifconfig h2-eth0 192.168.10.1 netmask 255.255.255.0')
  h2.cmd('ifconfig h2-eth1 192.168.20.1 netmask 255.255.255.0')
  h2.cmd("echo 1 > /proc/sys/net/ipv4/ip_forward")
  h1.cmd("ifconfig h1-eth0 0")
  h3.cmd("ifconfig h3-eth0 0")
  h1.cmd("ip address add 192.168.10.2/24 dev h1-eth0")
  h1.cmd("ip route add default via 192.168.10.1 dev h1-eth0")
  h3.cmd("ip address add 192.168.20.2/24 dev h3-eth0")
  h3.cmd("ip route add default via 192.168.20.1 dev h3-eth0")
  
  CLI(net)
  net.stop()
```
加入docker之後要修成下內容

```
 #from mininet.net import Mininet
  from containernet.net import Containernet
```
```
 #net = Mininet(link=TCLink)
  net = Containernet(link=TCLink)
```
h3 設定為docker container
```
  #h3 = net.addHost('h3')
   h3=net.addDocker('h3', dimage="ubuntu:trusty")
```
執行
```
sudo python 3.py
```
開啟h1 h2 
```
xterm h1 h2 
```
開啟h3
```
sudo docker exec -it mn.h3 /bin/bash 
```
h3 ping h2、h1，發現ping不到h1
<img src="image/20200330h3_fail.PNG" width=400></img>

查看路由表，發現預設路由沒設好
```
ip route show
```
<img src="image/20200330h3_route.PNG" width=400></img>

所以先把原本的預設路由刪掉，再加上去
```
  sudo ip route del default
  sudo ip route add default via 192.168.10.2 dev h3-eth0
```
改完就可ping 到了

重點:當ping 出現錯誤時
<img src="image/ping_fail.jpg" width=400></img>

## 建立ssh
因為docker完全隔離，所以ssh要自己建立起來

先建立新的docker container
```
docker run -it ubuntu:trusty /bin/bash
root@hdsadsf:/# apt-get update
root@hdsadsf:/# apt-get install -y openssh-server
root@hdsadsf:/# service ssh start
 * Starting OpenBSD Secure Shell server sshd                             [ OK ]
```
> cp /etc/vim/vimrc ~/.vimrc
讓vi 可以正常使用

確定ssh建立好，就儲存image檔
```
docker commit [container id] [image名稱]
dccker commit 1908b3b1f933 ubuntu:ssh
```
然後再修改之前的python檔
```
h3=net.addDocker('h3', dimage="ubuntu:ssh")
```
這樣h3就能用ssh了