sudo apt-get update && sudo apt-get upgrade -y
sudo do-release-upgrade

sudo apt install ntpdate gh ssh-import-id ca-certificates curl gnupg lsb-release tmux -y

ssh-import-id-gh robertolechowski

echo "alias cls="clear"" >> ~/.bashrc

cat << 'EOF' >> ~/.bashrc
alias ufw_status='sudo ufw status verbose'
alias ps_docker='docker ps --format "table {{printf \"%.12s\" .ID}}\t{{printf \"%.25s\" .Names}}\t{{printf \"%.45s\" .Image}}\t{{.Status}}\t{{.Ports}}"'
EOF

source ~/.bashrc


curl -o webmin-setup-repo.sh https://raw.githubusercontent.com/webmin/webmin/master/webmin-setup-repo.sh
sudo bash webmin-setup-repo.sh
sudo apt-get install --install-recommends webmin usermin
sudo systemctl status webmin
sudo ufw allow 10000/tcp


sudo apt  install docker.io
sudo apt install docker-compose-v2

sudo groupadd docker
sudo gpasswd -a $USER docker

sudo ufw default deny incoming  
sudo ufw default allow outgoing  
sudo ufw allow OpenSSH  
sudo ufw enable  
sudo ufw status verbose

sudo reboot

docker login ghcr.io -u robertolechowski
gh auth login