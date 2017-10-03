FROM php:7.0-apache
LABEL maintainer.name="ipunkt Business Solutions OHG"

ARG REVIVE_VERSION="4.0.2"

RUN docker-php-source extract \
    && docker-php-ext-install mysqli \
    && docker-php-source delete

RUN curl -sSL "https://download.revive-adserver.com/revive-adserver-$REVIVE_VERSION.tar.gz" | tar xz --strip-components=1 \
	&& chmod -R a+w /var/www/html/var \
	&& chmod -R a+w /var/www/html/var/cache \
	&& chmod -R a+w /var/www/html/var/plugins \
	&& chmod -R a+w /var/www/html/var/templates_compiled \
	&& chmod -R a+w /var/www/html/plugins \
	&& chmod -R a+w /var/www/html/www/admin/plugins \
	&& chmod -R a+w /var/www/html/www/images