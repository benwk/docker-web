FROM node:10.16-stretch-slim

MAINTAINER benwk

# 安装依赖
RUN apt-get update && apt-get install -y nginx

# 设置应用目录
WORKDIR /app
RUN mkdir -p /app/website /app/sso /app/portal /app/console

# 增加启动脚本
ADD docker/docker-entrypoint.sh /app
RUN chmod +x /app/docker-entrypoint.sh

# 配置反向代理
ADD docker/release.conf /etc/nginx/conf.d/default.conf
# ADD docker/nginx.conf /etc/nginx/nginx.conf

# 设置容器端口
EXPOSE 80

# 容器启动命令
ENTRYPOINT ["/app/docker-entrypoint.sh"]
