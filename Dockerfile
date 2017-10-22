FROM registry.centos.org/centos:centos7
MAINTAINER 9chakri@gmail.com 

LABEL com.examplecompany.version="0.0.1-beta" \
      vendor="Redhat" \ 
      com.examplecompany.release-date="2015-02-12" \
      com.examplecompany.version.is-production="true"

RUN  yum update -y \
     yum install wget tcpdump -y \
     yum clean all

CMD ["echo","This container can only be used as a based image for applications"]