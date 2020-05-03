OVPN_DATA="ovpn-data-example"

# Start the VPN server.
docker run --rm --name ovpn_server -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN ovpn_server

