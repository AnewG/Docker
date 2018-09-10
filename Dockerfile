FROM centos:6.10

RUN yum -y update \
    && yum -y groupinstall "Development Tools" \
    && yum -y install vim wget tar \
    && yum -y install httpd \
    && yum -y install mysql-server

RUN yum -y update nss 

RUN rpm --import http://ftp.riken.jp/Linux/fedora/epel/RPM-GPG-KEY-EPEL-6

RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

# Install Git need package
RUN yum -y install curl-devel expat-devel gettext-devel devel zlib-devel perl-devel

# Install php (https://webtatic.com/packages/php56/)
RUN yum -y install php56w php56w-cli php56w-common php56w-devel php56w-fpm php56w-mbstring php56w-xml php56w-mysql php56w-pdo php56w-gd php56w-pecl-imagick php56w-opcache php56w-pecl-memcache php56w-pecl-xdebug

RUN rm -rf /var/cache/yum/* && yum clean all

ADD httpd.conf /etc/httpd/conf/httpd.conf
ADD php.ini /etc/php.ini

EXPOSE 80

# CMD ["python", "app.py"]
# https://github.com/imagine10255/centos6-lnmp-php56/blob/master/Dockerfile
# apache2.2(+vagrant配置文件)  mysql  php5.6(+vagrant配置文件)  挂载host目录  redis?  imageMagick?
# 以上服务的启动与设置开机启动，作为容器或服务启动脚本




