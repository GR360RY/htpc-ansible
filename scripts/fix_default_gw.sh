route del default || true
route -n | grep -qe '^0.0.0.0' || sudo route add default gw `grep routers /var/lib/dhcp/dhclient.eth1.leases | sort -u | awk '{print $3}' | awk -F";" '{print $1}'`
