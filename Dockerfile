FROM ubuntu-debootstrap:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get dist-upgrade -yq && apt-get install -yq ca-certificates openssl

WORKDIR /root
ENV HOME /root

ADD config.ini /root/config.ini
ADD hub-listener /root/hub-listener

RUN chmod +x /root/hub-listener

EXPOSE 80

CMD ["/root/hub-listener", "-listen=0.0.0.0:80", "-config-file=/root/config.ini"]
