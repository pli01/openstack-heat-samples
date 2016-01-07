# server

Launch the stack heat.yml with heat-parameters.yml
’’’
./bin/launch.sh openvpn myvpn
’’’

# client

’’’
apt-get install openvpn
wget -O /etc/openvpn/vpnaccess.tar.bz2 http://FIP/vpnaccess.tar.bz2
tar -xjvf /etc/openvpn/vpnaccess.tar.bz2 -C /etc/openvpn
add in client.conf
  http-proxy host port
openvpn --config client.conf --verb 6
’’’
