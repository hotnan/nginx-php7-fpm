FROM php:7.0.6-fpm
MAINTAINER clarence@skywidesoft.com

# Install additional PHP modules
RUN docker-php-ext-install pdo pdo_mysql

ENV NGINX_VERSION 1.8.1-1~jessie

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
                       ca-certificates nginx=${NGINX_VERSION} gettext-base \
	&& rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf fastcgi_params /etc/nginx/

ADD scripts/start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE 80 443

#CMD ["nginx", "-g", "daemon off;"]
CMD ["/bin/bash", "/start.sh"]