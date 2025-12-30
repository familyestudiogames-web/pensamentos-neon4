FROM alpine:3.18

ARG PB_VERSION=0.22.13

RUN apk add --no-cache curl unzip

RUN curl -L -o pb.zip https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
    && unzip pb.zip \
    && rm pb.zip

RUN mkdir /pb_data

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090", "--dir", "/pb_data"]
