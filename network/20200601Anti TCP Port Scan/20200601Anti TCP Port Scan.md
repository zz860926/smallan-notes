# Anti TCP Port Scan

TCP三向交握

<img src="../image/20200601syn_ack.png" width=400></img>

port號詢問，回覆是否開啟(syn+ack)

<img src="../image/20200601syn_ack2.png" width=400></img>

port scan 運用此方式一直詢問你機器有哪些port開啟，以進行之後種種的駭客攻擊

how to detect the port scan?
如何防護?

* solution:
the number of syn pkt is greater than the number of syn+ack pkt 
統計syn封包數量比syn+ack多的話就不再送syn+ack

```
apply {
    bit<1> set_drop=0;
    if (hdr.tcp.isValid()){ 
        if(hdr.tcp.flags==2) {
            add_syn_cnt();
    
            hash(meta.flowlet_map_index, HashAlgorithm.crc16, (bit<16>)0, { hdr.ipv4.srcAddr }, (bit<32>)100);
        bit<10> tmp;
            syn_ack_cnt.read(tmp, (bit<32>)meta.flowlet_map_index); 
        if(tmp==0 && meta.syn_count>3){
            set_drop=1;
            }
            if (tmp!=0 && meta.syn_count > (bit<10>)(3+tmp)){
            set_drop=1;  
            }
        } else if (hdr.tcp.flags==0x12) {
            add_syn_ack_cnt();
        }	
    }

    if( hdr.ipv4.isValid() && set_drop==0){
            ip_forward.apply();
    }
}
```
> [anti_tcp_port_scan程式碼](../)

執行
```
sudo p4run 
```
> [執行操作](http://csie.nqu.edu.tw/smallko/sdn/anti_tcp_syn_port_scan.htm)

備註
```
register<bit<10>>(1024) syn_cnt;
100個空間
1個有10bit的大小
```
立即開啟80port
```
python -m SimpleHTTPServer 80
```
<img src="../image/20200601create_port.png" width=400></img>

## port scan
```
h1 nc -vnz -w 1 10.0.3.1 80-85
-v verbose
-z scan
-w wait
-w 1 等一秒
```
<img src="../image/20200601nc_vnz.png" width=400></img>
> 可以看到84-85沒有回應了

可連到伺服器做指令操作
```
user@ubuntu:/home/share/anti-nmap-port-scan$ simple_switch_CLI --thrift-port 9090
Obtaining JSON from switch...
Done
Control utility for runtime P4 table manipulation
RuntimeCmd: 
```
<img src="../image/20200601syn_cnt.png" width=400></img>

可以看出相同位置的封包數量syn>syn+ack的數量(8>1)

# nmap port scan
但以上方法只能防止(syn)(syn+ack)互傳的封包
namp -sF 使用fin封包傳遞就不能防範
<img src="../image/20200601nmap-sF.png" width=600></img>
> [參考資料](http://n.sfs.tw/content/index/10505)

指令
```
h1 nmap -sF -p 75-80 10.0.3.1
```
所以我修改anti-tcp-port-scan的程式碼

```
if(hdr.tcp.flags==1){
    bit<10> ack_rst;
    hash(meta.flowlet_map_index, HashAlgorithm.crc16, (bit<16>)0, { hdr.ipv4.srcAddr }, (bit<32>)100);
    ack_rst_cnt.read(ack_rst, (bit<32>)meta.flowlet_map_index); 
    if(ack_rst>3){
        set_drop=1;
    }
}

if( hdr.ipv4.isValid() && set_drop==0){
        ip_forward.apply();
}
```
> [anti-tcp-port-sacn](../)

要跟大家補充一下
<img src="../image/20200601tcp_header.jpg" width=600></img>
FIN在tcp flags裡為1
如果ack+rst超過三以上的話就把不把封包再送過去

那為什麼指定ack+rst呢?
<img src="../image/20200601ack+rst.png" width=600></img>
> wireshark 觀察到的

## 實驗
```
h1 nmap -sF -p 60-100 10.0.3.1
```
誤差:
因為nmap 一次傳大量的帶有fin flag的封包，所以程式紀錄上會慢一拍，不過駭客攻擊都是大量的封包攻擊，所以防護上是有效的

一開始port scan
<img src="../image/20200601anti_wireshark.png" width=600></img>
之後的
<img src="../image/20200601anti_after_wireshark.png" width=600></img>

## bug:
nmap一開始都會先去探查常用port
一開始會讓6-8個port查詢到
## 問題: 
是否可以封鎖flag為fin的封包?