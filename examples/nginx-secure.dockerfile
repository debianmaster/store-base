FROM examplecompany/store-base
MAINTAINER 9chakri@gmail.com 

LABEL io.k8s.display-name="Nginx" \
      io.k8s.expose-services="8080:http" \
      io.k8s.expose-services="8443:https" \
      com.examplecompany.version.is-production="true"

RUN yum install -y epel-release && \
    yum install -y nginx && \
    yum clean all 

# Run nginx with 8080 / 8443 instead of 80 and 443
# Change directory permissions for running nginx as user 1001
RUN sed -i 's/80 default_server/8080 default_server/g'  /etc/nginx/nginx.conf && \
    sed -i 's/443 default_server/8443 default_server/g'  /etc/nginx/nginx.conf && \
    touch /run/nginx.pid &&  chown -R 1001:0 /run/nginx.pid && \
    chown -R 1001:0 /var/log/nginx && \
    chown -R 1001:0 /var/lib/nginx  && \ 
    chown -R 1001:0 /etc/nginx

ADD ./examples/sample-website/ /usr/share/nginx/html

VOLUME ["/var/log/nginx"]

USER 1001
EXPOSE 8080 8443
CMD ["nginx", "-g", "daemon off;"]