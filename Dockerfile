# 使用 ubuntu:22.04 作为基础镜像
FROM ubuntu:22.04

# 安装必要的工具
RUN apt update && apt install -y curl wget vim git net-tools iputils-ping

# 安装 Go 1.24.0
RUN wget https://go.dev/dl/go1.24.0.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.24.0.linux-amd64.tar.gz && \
    rm go1.24.0.linux-amd64.tar.gz

# 设置环境变量
ENV PATH="/usr/local/go/bin:/usr/local/bin:${PATH}"

# 安装 Ignite CLI
RUN curl https://get.ignite.com/cli! | bash

# 设置工作目录
WORKDIR /work

# 默认命令为 bash
CMD ["/bin/bash"]

