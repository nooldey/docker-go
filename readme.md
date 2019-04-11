# 构建镜像

```bash
docker build -t nooldey/centos .
```

# 用镜像创建容器运行

```bash
docker run -t -i nooldey/centos /bin/bash
```

# 容器内更新镜像

### 从容器创建一个新的镜像

```bash
docker commit -m="update images: nooldey/centos" -a="nooldey" x nooldey/centos
```

# 挂载宿主机目录

```bash
docker run -t -i -v /f/web-deep/dockers/customDock/dev:/data/dev nooldey/centos /bin/bash
```

# docker run 指令

> -a stdin: 指定标准输入输出内容类型，可选 STDIN/STDOUT/STDERR 三项；
>
> -d: 后台运行容器，并返回容器ID；
>
> -i: 以交互模式运行容器，通常与 -t 同时使用；
>
> -p: 端口映射，格式为：主机(宿主)端口:容器端口
>
> -t: 为容器重新分配一个伪输入终端，通常与 -i 同时使用；
>
> -v: 挂载宿主机目录，格式为： 主机目录:容器目录
>
> --name="nginx-lb": 为容器指定一个名称；
>
> --dns 8.8.8.8: 指定容器使用的DNS服务器，默认和宿主一致；
>
> --dns-search example.com: 指定容器DNS搜索域名，默认和宿主一致；
>
> -h "mars": 指定容器的hostname；
>
> -e username="ritchie": 设置环境变量；
>
> --env-file=[]: 从指定文件读入环境变量；
>
> --cpuset="0-2" or --cpuset="0,1,2": 绑定容器到指定CPU运行；
>
> -m :设置容器使用内存最大值；
>
> --net="bridge": 指定容器的网络连接类型，支持 bridge/host/none/container: 四种类型；
>
> --link=[]: 添加链接到另一个容器；
>
> --expose=[]: 开放一个端口或一组端口；
