## install pox 
## install ovs
[install web](http://docs.openvswitch.org/en/latest/intro/install/general/)
```
git clone https://github.com/openvswitch/ovs.git
cd ovs
./boot.sh
./configure --with-linux=/lib/modules/$(uname -r)/build
make
sudo make install
sudo make modules_install
/sbin/modprobe openvswitch
/sbin/lsmod | grep openvswitch
```

> ovsdb-server: /usr/local/var/run/openvswitch/ovsdb-server.pid.tmp: create failed (No such file or directory)

Check that that directory (/usr/local/var/run/openvswitch) exists.