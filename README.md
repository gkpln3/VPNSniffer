# Install

Make sure you have docker and wireshark installed.

#### Windows:
Download and install docker and wireshark from their websites.

#### Ubuntu:
```
apt-get install docker wireshark
```

#### Mac:
```
brew install docker wireshark
```

# Usage

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

## Creating a VPN tunnel over USB (USB reverse tethering)
This enables you to pipe internet connection through USB to the mobile phone, even without wifi.

Good when using a firewalled network, or through mobile tethering on iOS (which blocks all connections to devices inside the network).

Requires root (or at least ssh to the phone).

We need to start the server in the exact same way, but with using TCP (since ssh can only create a TCP tunnel).

Go to the USB folder, and follow the same steps seen in Usage.


# Sniffing without VPN
It's possible to sniff the data after poisoning the arp table of the target device, although a few extra steps are required to allow the traffic to pass through.

#### Windows
Install Linux or get a Mac and continue.

#### Ubuntu
From: https://github.com/moxie0/sslstrip

Install arpspoof
```
apt-get install arpspoof
```

Flip your machine into forwarding mode (as root):
```
echo "1" > /proc/sys/net/ipv4/ip_forward
```

Setup iptables to intercept HTTP requests (as root):
```
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port <yourListenPort>
```

#### Mac
From http://iosmanbh.blogspot.com/2014/09/mac-os-x-arp-spoofing.html

Install macport

Install dsniff
```
sudo port selfupdate
sudo port install dsniff-devel
```

Find victim ip
```
arp -a
```

Open net forwarding,it will forward packets which recive to Internet Connection.
```
sudo sysctl -w net.inet.ip.forwarding=1
sudo sysctl -w net.inet.ip.fw.enable=1
```

Arpspoof Router
```
sudo arpspoof -i Yourineterface -t victim_ip router_ip
sudo arpspoof -i Yourineterface -t router_ip victim_ip
```

Example:
```
sudo arpspoof -i en0 -t 192.168.1.100 192.168.1.1
sudo arpspoof -i en0 -t 192.168.1.1 192.168.1.100
```

# Another way (requires root access to the device, but more stable)
Instead of arp spoofing, just login to the device and edit its arp tables.

To make sure the connection will still be up, we need to enable IP forwarding (through our sniffing computer) first.

#### Windows
Stop... just stop...

#### Mac
```
sudo sysctl -w net.inet.ip.forwarding=1
```

#### Linux
```
echo "1" > /proc/sys/net/ipv4/ip_forward
```

Now log into the device and edit its arp tables using the following command:
```
arp -s [target] [my_computer_mac_address]
```

# Decrypt ssl communication
See [iOS SSL Sniffer](https://github.com/gkpln3/ios_ssl_sniffer)
