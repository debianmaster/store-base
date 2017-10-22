FROM debianmaster/store-base
MAINTAINER 9chakri@gmail.com 

RUN yum install -y epel-release && \
    yum install -y nginx && \
    yum clean all 

ADD ./examples/sample-website/ /usr/share/nginx/html

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]