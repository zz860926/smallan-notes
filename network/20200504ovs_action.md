# ovs(action)

forward
flood
drop
modity header field

mod_nw_src可以用來NAT  
NAT : 私有網路要轉成外部網路時用
mod_nw_dst可以用來DNAT
DNAT : 
## 範例
priority,愈大能壓掉小的
output轉送
```
mininet-wifi> sh ovs-ofctl add-flow s1 priority=1,in_port=2,action=output:1
mininet-wifi> sh ovs-ofctl add-flow s1 priority=2,in_port=1,action=output:2
```
指令mode_nw_src
```
sh ovs-ofctl add-flow s1 priority=1,ip,in_port=1,action=mode_nw_src"1.1.1.1"
```
```
ip,in_port=1
```
","是AND

mod_nw_ecn
ecn 顯式擁塞通知(Explicit Congestion Notification)

```
sh ovs-ofctl add-flow s1 priority=200,ip,in_port=1,action=output:2,2
```
,2 封包送兩次出去，可避免封包遺失

layer1|layer2|layer3|layer4
---|---|---|---
in_port=1|dl_src|nw_src|tp_src
---|dl_dst|nw_dst|tp_dst
---|mac|ip|port
```
sh ovs-ofctl add-flow s1 ip,tcp,tp_dst=80,actions=output:2
```
ip,tcp,tp_dst=80 設定port時要連ip,tcp都要寫

可以查看封包的使用率
```
sh ovs-ofctl dump-port s1
```

```
sh ovs-ofctl add-flow s1 priority=1,hard_timeout=0,idle_timeout=0,in_port=1,actions=output:2
```
hard_timeout 多久被移除
idle_timeout 有被使用就不會被移除，只要閒置多久就會被移除
=0的話就是永不移除

## 作業1
讓h1、h2、h3互ping 
<img src="image/20200504topo.png" width=400></img>
```
mn --topo single,3 --controller=remote
```
解:
```
sh ovs-ofctl add-flow s1 in_port=1,action=flood
sh ovs-ofctl add-flow s1 in_port=2,action=flood
sh ovs-ofctl add-flow s1 in_port=3,action=flood
```
action=flood
将数据包输出到所有物理端口，除了该数据包的输入口以及不可被flooding的端口。

```
mn --mac
```
加入參數後，mac位置從1開始的連號
