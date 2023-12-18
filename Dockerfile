FROM i386/centos:7
MAINTAINER AVL <avlubimov@gmail.com>
LABEL maintainer="AVL <avlubimov@gmail.com>"
LABEL description="Cupsd on top of centos i386"
LABEL cups="cups-1.6.3-52.el7_9.i686"

ENV VOLUME=/srv

#RUN sed -i '/excludedocs/d' /etc/rpm/macros.imgcreate
RUN sed -i '/nodocs/d' /etc/yum.conf
RUN ulimit -n 1024 && yum -q update -y && yum -q install -y cups file

RUN mkdir -p ${VOLUME}
RUN mkdir -p ${VOLUME}/cups
RUN mkdir -p ${VOLUME}/rpm

COPY --chown=root:root --chmod=0755 docker-entrypoint.sh /
COPY rpm/*.rpm ${VOLUME}/rpm
RUN ulimit -n 1024 && rpm -Uvh ${VOLUME}/rpm/* 

RUN mv /etc/cups/* ${VOLUME}/cups/


CMD ["/docker-entrypoint.sh"]




