#!/bin/bash
# scan a host you control
nmap --script ssl-enum-ciphers -p 443 example.com

# if the host blocks ping, skip host discovery
nmap -Pn --script ssl-enum-ciphers -p 443 example.com

# add cert details too
nmap -p 443 --script ssl-enum-ciphers,ssl-cert example.com

# if your TLS service runs on another port (e.g., 8443)
nmap --script ssl-enum-ciphers -p 8443 example.com
