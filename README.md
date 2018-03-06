# 基于Alpine的UniFI控制器

控制器版本：5.5.24

请使用以下命令部署容器：

```
git clone https://github.com/xiangjl/docker-unifi-controller.git

cd docker-unifi-controller/

docker build -t xiangjl/unifi-controller .

docker run -d --name unifi \
  -p 8080:8080/tcp -p 8443:8443/tcp -p 8880:8880/tcp -p 8843:8843/tcp -p 6789:6789/tcp -p 3478:3478/udp -p 10001:10001/udp \
  -v /datadir/of/your/choice:/opt/unifi/data \
  -v /datadir/of/your/choice:/opt/unifi/logs \
  --restart=always \
  xiangjl/unifi-controller
```

更多信息，访问以下网站:
 * https://www.ubnt.com/
 * https://www.ubnt.com/enterprise/software/
 * https://community.ubnt.com/t5/custom/page/page-id/Blogs


# Docker Image for Ubiquiti Network's UniFi Controller

Installs the controller from the stable release channel (at them moment: 5.5.24).

To start the controller, launch a container like this:

```
git clone https://github.com/xiangjl/docker-unifi-controller.git

cd docker-unifi-controller/

docker build -t xiangjl/unifi-controller .

docker run -d --name unifi \
  -p 8080:8080/tcp -p 8443:8443/tcp -p 8880:8880/tcp -p 8843:8843/tcp -p 6789:6789/tcp -p 3478:3478/udp -p 10001:10001/udp \
  -v /datadir/of/your/choice:/opt/unifi/data \
  -v /datadir/of/your/choice:/opt/unifi/logs \
  --restart=always \
  xiangjl/unifi-controller
```

For more information, visit their website:
 * https://www.ubnt.com/
 * https://www.ubnt.com/enterprise/software/
 * https://community.ubnt.com/t5/custom/page/page-id/Blogs
