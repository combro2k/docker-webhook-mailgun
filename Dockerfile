FROM busybox:latest

WORKDIR /root
ENV HOME /root

ADD config.ini /root/config.ini
ADD hub-listener /root/hub-listener

RUN chmod +x /root/hub-listener

VOLUME ["/root/config.ini"]

CMD ["/root/hub-listener", "-listen=0.0.0.0:80", "-config-file=/root/config.ini"]
