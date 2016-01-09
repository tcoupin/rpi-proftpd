FROM sdhibit/rpi-raspbian:jessie
MAINTAINER Thibault Coupin <thibault.coupin@gmail.com>

RUN apt-get update && apt-get install -y proftpd-basic

RUN mkdir /proftpd

ADD proftpd.conf /proftpd/
ADD start.sh users /


EXPOSE 20 21 50000-50050

CMD /bin/bash /start.sh
