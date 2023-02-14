#! /bin/bash
/usr/sbin/sshd
/usr/bin/vpp -c /etc/vpp/startup.conf
while true; do sleep 300; done
