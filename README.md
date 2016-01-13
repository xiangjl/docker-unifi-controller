# Docker Image for Ubiquiti Network's UniFi Controller

Installs the controller from the stable release channel (at them moment: 4.7.6).

To start the controller, launch a container like this:

```
docker build -t xiangjl/unifi .

docker run -d --name unifi \
  -p 8080:8080 -p 8443:8443 -p 8880:8880 -p 8843:8843 \
  -v /datadir/of/your/choice:/opt/unifi/data \
  --restart=always \
  xiangjl/unifi
```

For more information, visit their website:
 * https://www.ubnt.com/
 * https://www.ubnt.com/enterprise/software/
 * https://community.ubnt.com/t5/custom/page/page-id/Blogs
