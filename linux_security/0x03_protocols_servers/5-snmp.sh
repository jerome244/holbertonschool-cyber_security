# 1) Minimal, known-good v2c config (loopback only)
sudo tee /etc/snmp/snmpd.conf >/dev/null <<'EOF'
agentAddress  udp:127.0.0.1:161
rocommunity   myStrongCommunity  127.0.0.1
sysLocation   Local
sysContact    you@example.com
sysServices   72
EOF

# 2) Restart and verify it’s bound
sudo systemctl restart snmpd 2>/dev/null || sudo service snmpd restart
sudo ss -lunp | grep ':161'

# 3) Allow UDP/161 just in case (some UFW setups can interfere)
sudo ufw allow 161/udp

# 4) Test with numeric OID (no MIBs needed)
snmpget -v2c -c myStrongCommunity -t 2 -r 1 127.0.0.1 .1.3.6.1.2.1.1.5.0
