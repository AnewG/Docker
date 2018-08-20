# Docker

```
依赖管理: docker-stack [处理多个服务之间的依赖关系与自动化脚本], docker-compose(x)
集群管理: Kubernetes, docker-swarm(x)
远程主机或虚拟机上安装Docker: docker-machine

创建镜像的一种方法
  1.从github中下载某个配置的镜像源文件（包括 Dockerfile 所需的上下文文件，add/copy 需要用到）
  2.修改 Dockerfile，重新 build 镜像
  3.上传 Hub，后续直接使用或做为基础镜像
```
