# 1. 构建阶段：使用官方 Node 镜像来编译前端资源
FROM node:18-alpine AS builder

# 安装 Python 和构建工具
#RUN apk add --no-cache python3 make g++
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache python3 make g++

# 设置工作目录
WORKDIR /app

# 拷贝项目依赖文件
COPY package*.json ./

# 安装依赖 跳过不兼容vue3的库，该项目使用了一个vue2的库，docker会严格检查版本冲突导致build失败
# RUN npm install --legacy-peer-deps
#RUN npm config set registry https://registry.npmmirror.com && \
#    npm install --legacy-peer-deps
RUN npm install -g cnpm --registry=https://registry.npmmirror.com && \
    cnpm install --legacy-peer-deps


# 拷贝其他前端源代码
COPY . .

# 编译生产环境资源
RUN npm run build

# 2. 生产环境阶段：使用 Nginx 作为静态服务器
FROM nginx:alpine

# 拷贝构建好的资源到 nginx 的默认路径
COPY --from=builder /app/dist /usr/share/nginx/html

# 拷贝自定义 Nginx 配置（可选）
#COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露端口
EXPOSE 80

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]