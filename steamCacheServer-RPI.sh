#! /bin/bash
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
cp /etc/apt/sources.list /etc/apt/sources.list.bak
rm -rf /etc/apt/sources.list /etc/apt/sources.list
echo 'deb https://mirrors.cloud.tencent.com/debian/ buster main contrib non-free
deb https://mirrors.cloud.tencent.com/debian/ buster-updates main contrib non-free
deb https://mirrors.cloud.tencent.com/debian/ buster-backports main contrib non-free
deb https://mirrors.cloud.tencent.com/debian-security buster/updates main contrib non-free' >/etc/apt/sources.list
cp /etc/apt/sources.list.d/raspi.list /etc/apt/sources.list.d/raspi.list.bak
rm /etc/apt/sources.list.d/raspi.list
apt update
apt upgrade -y
apt-get purge docker-ce docker-ce-cli containerd.io -y
rm -rf /var/lib/docker
rm -rf /var/lib/containerd
curl -fsSL https://get.docker.com -o get-docker.sh
bash get-docker.sh --mirror Aliyun
apt install libffi-dev -y
echo '{
    "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"]
}'>/etc/docker/daemon.json
systemctl restart docker.service
pip3 config set global.index-url https://mirrors.cloud.tencent.com/pypi/simple
pip3 install docker-compose
#echo 'deb http://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ buster main ui' >/etc/apt/sources.list.d/raspi.list
echo 'echo 'deb http://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ buster main ui' >/etc/apt/sources.list.d/raspi.list'>/home/pi/add_raspi.list.sh
sudo chmod +x /home/pi/add_raspi.list.sh
git clone https://github.com/jrcichra/lancache-rpi.git
echo 'docker-compose up -d' >/home/pi/lancache-rpi/run.sh
sudo chmod +x /home/pi/lancache-rpi/run.sh
sudo apt install btrfs-progs -y
docker run -d -p 9000:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock --name prtainer-test portainer/portainer
docker run -d --name=netdata \
  -p 19999:19999 \
  -v netdatalib:/var/lib/netdata \
  -v netdatacache:/var/cache/netdata \
  -v /etc/passwd:/host/etc/passwd:ro \
  -v /etc/group:/host/etc/group:ro \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /etc/os-release:/host/etc/os-release:ro \
  --restart unless-stopped \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  netdata/netdata
 echo 'Install Done,Edit .env Then Use'
 echo 'sudo bash start.sh'
 echo 'run server'