# What ports are actually in use
sudo ss -ltnp | grep -E ':(80|81|8080|443)\b'

# Which ports your web server is configured to listen on
# Nginx:
sudo grep -R "listen" /etc/nginx/sites-enabled/
# Apache:
sudo grep -R "^Listen" /etc/apache2/ports.conf /etc/apache2/sites-enabled/

# Firewall openings (UFW)
sudo ufw status numbered
