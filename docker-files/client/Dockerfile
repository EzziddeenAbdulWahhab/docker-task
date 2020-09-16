FROM centos:centos7

ARG repo_url
RUN yum install yum-utils -y 
RUN yum-config-manager --disable \*
RUN yum-config-manager --add-repo $repo_url
RUN yum install --nogpgcheck httpd -y

