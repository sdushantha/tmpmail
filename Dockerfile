FROM alpine:3.15.4

RUN apk --no-cache add curl jq w3m xclip util-linux

RUN curl -L "https://raw.githubusercontent.com/sdushantha/tmpmail/master/tmpmail" > tmpmail && chmod +x tmpmail

RUN mv tmpmail /bin/
