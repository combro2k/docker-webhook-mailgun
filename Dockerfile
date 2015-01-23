FROM ubuntu:14.04

RUN apt-get update && apt-get dist-upgrade

WORKDIR /root
ENV HOME /root

ADD config.ini /root/config.ini
ADD hub-listener /root/hub-listener

RUN chmod +x /root/hub-listener

CMD ["/root/hub-listener", "-listen=0.0.0.0:80", "-config-file=/root/config.ini"]
