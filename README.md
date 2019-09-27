# Docker

```

基本概念：
------------
pull -- Internet --> local-machine: imageA, imageB, ima...

imageX run --> InstanceA [在退出前所做的操作不影响其他实例]
       run --> InstanceB
       ru...

```


```
依赖管理: docker-stack [处理多个服务之间的依赖关系与自动化脚本], docker-compose(x)
  https://vsupalov.com/difference-docker-compose-and-docker-stack/
集群管理: Kubernetes, docker-swarm(x)
远程主机或虚拟机上安装Docker: docker-machine

创建镜像的一种方法
  1.从github中下载某个配置的镜像源文件（包括 Dockerfile 所需的上下文文件，add/copy 需要用到）
  2.修改 Dockerfile，重新 build 镜像
  3.上传 Hub，后续直接使用或做为基础镜像
  


无用镜像清理：docker rmi $(docker images -f "dangling=true" -q)
列出镜像：   docker images
创建镜像：   docker build -t lamp .
直接运行：   docker run -p 80:80 lamp
打标签：     docker tag old anewg/xxxx:var1
登入cloud： docker login
推送镜像：   docker push anewg/xxxx:var1


初始化swarm：docker swarm init
启动stack：  docker stack deploy -c docker-compose.yml lamp
查看stack：  docker stack ps lamp
清理stack：  docker stack rm lamp
清理swarm：  docker swarm leave --force
查看node：   docker node ls
查看container与进入：
  docker ps, docker exec -i -t xxxx bash
查看server：
  docker service ls [server 包含1或多个container]
  docker service ps server_name
  docker service inspect #service_id
  
  

Docker概念：
  1.swarm里的node: 无伦物理机还是虚拟机都可以加入为节点，节点分为管理节点和工作节点，docker node ls
  2.docker stack deploy -c config.yml xxx 
    docker stack ps xxx
    根据 config.yml 生成多个容器负载均衡在已加入的 node 集合中，使用任意 node 都能访问到其中的某一容器
  3.https://blog.waterstrong.me/docker-networking/
    veth pair: 它在宿主机和容器内分别创建虚拟接口，并让它们彼此连通
    启动Docker时会在宿主机上创建一个名为 docker0(example:172.17.0.1/16) 的虚拟网桥, 容器内的虚拟接口为eth0(172.17.x.x), 由 veth 链接
  4.数据存储
    https://www.cnblogs.com/51kata/p/5266626.html
```
