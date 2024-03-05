FROM node:16.11.1-alpine3.14

LABEL maintainer="chenxu.mail@icloud.com"

ENV TZ="Asia/Shanghai"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk update
RUN apk add --no-cache --update git bash shadow
RUN node -v && npm -v
RUN npm config set registry https://registry.npmmirror.com
RUN npm i -g @squoosh/cli

WORKDIR /app/squoosh

RUN git clone https://github.com/ChenXu178/squoosh.git .

COPY start.sh start.sh

RUN npm install
RUN npm run build

EXPOSE 5000

VOLUME /app/data
WORKDIR /app/data

ENTRYPOINT ["/bin/bash","/app/squoosh/start.sh"]