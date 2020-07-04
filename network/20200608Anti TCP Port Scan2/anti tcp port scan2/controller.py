import nnpy
import struct
from p4utils.utils.topology import Topology
from p4utils.utils.sswitch_API import SimpleSwitchAPI
from scapy.all import Ether, sniff, Packet, TCP
from collections import Counter
count1= Counter()
count2= Counter()
val1=0
val2=0
blockip=[]

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
	global val1,val2

	if TCP in pkt and pkt[TCP].flags==2:
	  src = pkt.sprintf('{IP:%IP.src%}')
          dst = pkt.sprintf('{IP:%IP.dst%}')
          count1[(src, dst)] += 1
	  val1=count1[(src, dst)]
	  print "count1[",src,",",dst,"]=",count1[(src, dst)]
	if TCP in pkt and pkt[TCP].flags==18:
	  src = pkt.sprintf('{IP:%IP.src%}')
          dst = pkt.sprintf('{IP:%IP.dst%}')
          count2[(dst, src)] += 1
          val2=count2[(dst, src)]
	  print "count2[",dst,",",src,"]=",count2[(dst, src)]
	
	print "val1:", val1, " val2:", val2
        if (val1-val2>=3) and (TCP in pkt) and pkt[TCP].flags==2:
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
