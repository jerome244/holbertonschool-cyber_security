#!/bin/bash
sudo ss -ulpn
sudo nmap -sV -p 631,8080 127.0.0.1