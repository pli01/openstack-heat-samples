# server

* Modify heat-parameters.yml (network id, subnet-id, image, flavor)
* Launch the stack heat.yml with heat-parameters.yml
```
./bin/launch.sh openvpn myvpn
```

Client configuration and certificate are available for download at the URL found in the output of the stack
```
heat output-show my-stack Instance1_random_string
"http://xx.xx.xx.xx/abcbCk4eVRbFB2L63WZ494bHIutd4ObnUDWOMQfEGxnptpoDlrrT5NV4YwjgDA2xUPftQWSMN7VJ8qbmH2D2MalogUjMGiWuhV0plTTjptm7GSRmIvdfiPotsy4VEtax.tar.bz2
```

# client
* install openvpn package
* download config client and certificate

```
apt-get install openvpn
wget -O /etc/openvpn/vpnaccess.tar.bz2 http://FIP/vpnaccess.tar.bz2
tar -xjvf /etc/openvpn/vpnaccess.tar.bz2 -C /etc/openvpn
# If needed use http-proxy to connect to openvpn server, add in client.conf
  http-proxy host port
# launch openvpn
cd /etc/openvpn && openvpn --config client.conf --verb 3
```
