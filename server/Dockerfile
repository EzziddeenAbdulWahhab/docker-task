FROM centos:centos7

RUN mkdir httpd
RUN yum install --downloadonly --downloaddir=httpd httpd -y
RUN yum install httpd -y
COPY ./httpd.conf /etc/httpd/conf/httpd.conf
RUN mv httpd /var/www/html
RUN yum install createrepo -y
RUN createrepo /var/www/html

ENTRYPOINT /usr/sbin/httpd -DFOREGROUND
