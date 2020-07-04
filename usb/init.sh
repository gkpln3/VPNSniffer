OVPN_DATA="ovpn-data-example"

if [ $# -ne 1 ]; then
        echo "Usage: init.sh server_address"
        exit 1
fi

SERVER_ADDRESS=$1

# Build the docker image.
docker build -t ovpn_server ../

# Create openvpn configuration.
docker volume rm $OVPN_DATA
docker volume create --name $OVPN_DATA
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm ovpn_server ovpn_genconfig -u tcp://$SERVER_ADDRESS
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it ovpn_server ovpn_initpki

