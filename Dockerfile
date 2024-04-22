FROM alpine

RUN apk update && apk add wget git bash

WORKDIR /root

ENTRYPOINT ["/bin/bash", "/root/update-version"]
