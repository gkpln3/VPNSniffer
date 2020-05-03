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


1. Initialize the server for the first time `./init.sh`
2. Start the server `./start.sh`
3. Create a client `./create_client.sh client_name`
4. Transfer the client's configuration file to the target device.
5. Connect to the VPN server from the target device (search for OpenVPN on the Appstore).
6. Run `./wireshark.sh`.
