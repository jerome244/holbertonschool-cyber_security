# 0) Become root
sudo -s

# 1) Turn off UFW so you’re not fighting it
ufw --force disable
ufw --force reset

# 2) Run your (slightly safer) rules
iptables-save > /root/iptables.backup.$(date +%s).rules

iptables -F
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22  -j ACCEPT   # SSH
iptables -A INPUT -p tcp --dport 80  -j ACCEPT   # HTTP (if needed)
iptables -A INPUT -p tcp --dport 443 -j ACCEPT   # HTTPS (if needed)

iptables -L -n -v
