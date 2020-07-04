OVPN_DATA="ovpn-data-example"

# Proxy ssh through USB.
iproxy 2222 22 &
ssh -R 1194:localhost:1194 root@localhost -p 2222 &

# Start the VPN server.
docker run --rm --name ovpn_server -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/tcp --cap-add=NET_ADMIN ovpn_server

