import nnpy
import struct
from p4utils.utils.topology import Topology
from p4utils.utils.sswitch_API import SimpleSwitchAPI
from scapy.all import Ether, sniff, Packet, TCP
from collections import Counter
count1= Counter() # count the number of sync
count2= Counter() # count the number of sync + ack
count3= Counter() # count the number of sync + ack
val1=0 # get the value from count1
val2=0 # get the value from count2
val3=0
blockip=[]
state=Counter()
vals=0

class myController(object):
    def __init__(self):
        self.topo = Topology(db="topology.db")
        self.controllers = {}
        self.connect_to_switches()
 
    def connect_to_switches(self):
        for p4switch in self.topo.get_p4switches():
            thrift_port = self.topo.get_thrift_port(p4switch)
            #print "p4switch:", p4switch, "thrift_port:", thrift_port
            self.controllers[p4switch] = SimpleSwitchAPI(thrift_port)   
 
    def recv_msg_cpu(self, pkt):
        print "interface:", pkt.sniffed_on
        print "summary:", pkt.summary()
	global val1,val2,val3,vals

	if TCP in pkt and pkt[TCP].flags==2: #this is a TCP SYN pkt
	  src = pkt.sprintf('{IP:%IP.src%}')
          dst = pkt.sprintf('{IP:%IP.dst%}')
          count1[(src, dst)] += 1
	  val1=count1[(src, dst)]
	  state[(src, dst)] += 1
          vals=state[(src, dst)] 
	  print "count1[",src,",",dst,"]=",count1[(src, dst)]
	if TCP in pkt and pkt[TCP].flags==18: #this is a TCP SYN + ACK pkt
	  src = pkt.sprintf('{IP:%IP.src%}')
          dst = pkt.sprintf('{IP:%IP.dst%}')
          count2[(dst, src)] += 1
          state[(src, dst)] += 1
          val2=count2[(dst, src)]
          vals=state[(src, dst)]
	  print "count2[",dst,",",src,"]=",count2[(dst, src)]
        if TCP in pkt and pkt[TCP].flags==16: #this is a TCP ACK pkt 
	  src = pkt.sprintf('{IP:%IP.src%}')
          dst = pkt.sprintf('{IP:%IP.dst%}')
	  state[(src, dst)] += 1
          vals=state[(src, dst)]
        if TCP in pkt and pkt[TCP].flags==1: #this is a TCP FIN pkt 
	  src = pkt.sprintf('{IP:%IP.src%}')
          dst = pkt.sprintf('{IP:%IP.dst%}')
	  count3[(src, dst)] += 1
          val3=count3[(src, dst)]
	
	print "val1:", val1, " val2:", val2, " val3:", val3, " vals:", vals
        if (val1-val2>=3) and (TCP in pkt) and pkt[TCP].flags==2: #anti SYN port scan
	   src = pkt.sprintf('{IP:%IP.src%}')
	   if src not in blockip:
             self.controllers["s1"].table_add("block_pkt", "_drop", [str(src)], [])
	     blockip.append(src) 
        if (val3>=3) and (vals<3) and (TCP in pkt) and pkt[TCP].flags==1:  #anti FIN port scan
	   src = pkt.sprintf('{IP:%IP.src%}')
	   if src not in blockip:
             self.controllers["s1"].table_add("block_pkt", "_drop", [str(src)], [])
	     blockip.append(src) 
	   
     
    def run_cpu_port_loop(self):
        cpu_interfaces = [str(self.topo.get_cpu_port_intf(sw_name).replace("eth0", "eth1")) for sw_name in self.controllers]
        sniff(iface=cpu_interfaces, prn=self.recv_msg_cpu)
       
if __name__ == "__main__":
    controller = myController()
    controller.run_cpu_port_loop()
