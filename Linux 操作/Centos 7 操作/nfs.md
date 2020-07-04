# nfs
https://www.opencli.com/linux/rhel-centos-7-install-nfs-server

## 卸載
```
[andy@www ~]$ sudo df -h
Filessystem      Size  Used Avail Use% Mounted on
/dev/sda1        800G    5G  795G   1% /
devtmpfs         2.8G     0  2.8G   0% /dev
tmpfs            2.8G  180K  2.8G   1% /dev/shm
tmpfs            2.8G  9.1M  2.8G   1% /run
tmpfs            2.8G     0  2.8G   0% /sys/fs/cgroup
/dev/sda3        100G     0  100G   0% /home
/dev/sda2        2.0G  176M  1.9G   9% /boot
/dev/sdb1        500G     0  500G   0% /home/andy/movies
```
```
[andy@www ~]$ sudo umount /home/andy/movies
```