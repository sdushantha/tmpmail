FROM alpine:3.15.4

RUN apk --no-cache add curl jq w3m xclip util-linux

COPY tmpmail /bin/tmpmail

