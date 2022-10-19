#sudo nano /etc/docker/daemon.json
#sudo systemctl restart docker

sudo mkdir -p /config/local/
sudo rsync -aqz ./composer  /config/local/
sudo chown $USER $(find /config/) && sudo chgrp $USER $(find /config/)

docker compose --project-directory /config/local/composer/monitoring up -d
docker compose --project-directory /config/local/composer/portainer_agent up -d
