# RPI-LanCache-Script
一键部署局域网缓存服务器<p>
One Command Run LanCacheServer<p>
只在2020-5-28的arm64版本树莓派系统上测试过<p>
理论上是通用的(因为涉及修改软件源，不同的系统需要自行修改脚本<p>
Only Test On RPIOS(arm64 2020-5-28)<p>
克隆仓库<p>
git clone https://github.com/FantasyGmm/RPI-LanCache-Script.git<p>
进入文件夹<p>
cd RPI-LanCache-Script<p>
运行脚本<p>
sudo bash LanCacheServer-RPI.sh<p>
<p>
该脚本会更换软件源位腾讯镜像源<p>
会使用阿里源来安装docker<p>
下载并启动portainer及netdata<p>
<p>
本脚本使用的lancache源自下面仓库<p>
https://github.com/jrcichra/lancache-rpi<p>
