#!/bin/bash
# iDatam Dedicated Server - Initial Optimization Script
# Purpose: Basic network and security hardening for Bare Metal

echo "Starting iDatam Server Optimization..."

# 1. Update System
sudo apt-get update && sudo apt-get upgrade -y

# 2. Optimize Network Stack (TCP BBR)
# This improves throughput and reduces latency for global traffic
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p

# 3. Basic Security: Firewall Setup
# Allow SSH, HTTP, and HTTPS
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw --force enable

echo "Optimization Complete. Your iDatam Dedicated Server is ready."
