CLIENT_NAME=$1
OVPN_DATA="ovpn-data-example"

if [ $# -ne 1 ]; then
        echo "Usage: create_client.sh client_name"
        exit 1
fi

docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it ovpn_server easyrsa build-client-full $CLIENT_NAME nopass
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm ovpn_server ovpn_getclient $CLIENT_NAME > $CLIENT_NAME.ovpn
