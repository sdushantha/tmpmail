FROM alpine:3.15.3

RUN apk -U upgrade

RUN apk --no-cache add curl jq w3m \
    xclip # doesnot work because it requires X server \
    util-linux # for "columns" binary

RUN curl -L "https://git.io/tmpmail" > tmpmail && chmod +x tmpmail

RUN mv tmpmail /bin/
