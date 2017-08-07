# 基于CentOS的UniFI控制器

控制器版本：5.4.18

请使用以下命令部署容器：

```
git clone https://github.com/xiangjl/docker-unifi-controller.git

cd docker-unifi-controller/

docker build -t xiangjl/unifi-controller .

docker run -d --name unifi \
  -p 8080:8080 -p 8443:8443 -p 8880:8880 -p 8843:8843 -p 5678:5678 \
  -v /datadir/of/your/choice:/opt/unifi/data \
  --restart=always \
  xiangjl/unifi-controller
```

更多信息，访问以下网站:
 * https://www.ubnt.com/
 * https://www.ubnt.com/enterprise/software/
 * https://community.ubnt.com/t5/custom/page/page-id/Blogs


# Docker Image for Ubiquiti Network's UniFi Controller

Installs the controller from the stable release channel (at them moment: 5.4.18).

To start the controller, launch a container like this:

```
git clone https://github.com/xiangjl/docker-unifi-controller.git

cd docker-unifi-controller/

docker build -t xiangjl/unifi-controller .

docker run -d --name unifi \
  -p 8080:8080 -p 8443:8443 -p 8880:8880 -p 8843:8843 -p 5678 \
  -v /datadir/of/your/choice:/opt/unifi/data \
  --restart=always \
  xiangjl/unifi-controller
```

For more information, visit their website:
 * https://www.ubnt.com/
 * https://www.ubnt.com/enterprise/software/
 * https://community.ubnt.com/t5/custom/page/page-id/Blogs
