echo "PEERDNS=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf