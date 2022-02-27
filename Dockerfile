FROM alpine

RUN apk -U upgrade

RUN apk --no-cache add curl jq w3m \
    util-linux # for "columns" binary

RUN curl -L "https://git.io/tmpmail" > tmpmail && chmod +x tmpmail

RUN mv tmpmail /bin/
