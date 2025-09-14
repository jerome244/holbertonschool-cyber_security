sudo apt install -y iperf3 iperf3 -s
sudo ss -ltnp | grep ':5201'
# note the PID, then:
sudo kill <PID>
iperf3 -s
iperf3 -s -p 5202
sudo ufw allow 5202/tcp
iperf3 -c 127.0.0.1 -p 5202
