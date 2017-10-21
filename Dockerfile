FROM registry.centos.org/centos:centos7
MAINTAINER 9chakri@gmail.com 

LABEL com.example.version="0.0.1-beta" \
      vendor="Redhat" \ 
      com.example.release-date="2015-02-12" \
      com.example.version.is-production="true"

RUN  yum update -y \
     yum install wget tcpdump -y \
     yum clean all

CMD ["echo","This container can only be used as a based image for applications"]