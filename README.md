# Install

Make sure you have docker and wireshark installed.

### Windows:
Install linux or get a Mac and continue.

### Ubuntu:
```
apt-get install docker wireshark
```

### Mac:
```
brew install docker wireshark
```

# Usaage

Initialize the server for the first time.
```
./init.sh server_ip
```

Start the server.
```
./start.sh
```

Create a client.
```
./create_client.sh client_name
```

Transfer the client's configuration file to the target device.

Connect to the VPN server from the target device (search for OpenVPN on the Appstore).

Open wireshark and start sniffing.
```
./wireshark.sh
```
