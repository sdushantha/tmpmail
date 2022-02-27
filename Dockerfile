FROM alpine

RUN apk -U upgrade

RUN apk --no-cache add curl jq w3m


RUN curl -L "https://git.io/tmpmail" > tmpmail && chmod +x tmpmail


RUN mv tmpmail /bin/
