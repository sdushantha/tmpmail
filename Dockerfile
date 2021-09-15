FROM ubuntu

RUN apt-get update 

RUN apt-get upgrade -y

RUN apt-get install -y curl jq w3m \ 
  bsdmainutils # for "columns" binary


RUN curl -L "https://git.io/tmpmail" > tmpmail && chmod +x tmpmail


RUN mv tmpmail /bin/
