# RPI-LanCache-Script
一键部署局域网缓存服务器
One Command Run LanCacheServer
只在2020-5-28的arm64版本树莓派系统上测试过
理论上是通用的(因为涉及修改软件源，不同的系统需要自行修改脚本
Only Test On RPIOS(arm64 2020-5-28)
克隆仓库
git clone https://github.com/FantasyGmm/RPI-LanCache-Script.git
进入文件夹
cd RPI-LanCache-Script
运行脚本
sudo bash LanCacheServer-RPI.sh

该脚本会更换软件源位腾讯镜像源
会使用阿里源来安装docker
下载并启动portainer及netdata

本脚本使用的lancache源自下面仓库
https://github.com/jrcichra/lancache-rpi
