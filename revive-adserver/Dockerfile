FROM php:7.1-apache
ARG REVIVE_VERSION="3.2.5"
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.vendor="ipunkt Business Solutions OHG" \
      org.label-schema.version="$REVIVE_VERSION" \
      org.label-schema.vcs-url="https://github.com/ipunkt/docker-revive-adserver"

ENV REVIVE_VERSION="$REVIVE_VERSION"

ENV DB_HOST="localhost"
ENV DB_PORT="3306"
ENV DB_NAME="revive_adserver_325"
ENV DB_USERNAME="root"
ENV DB_PASSWORD=""

# Install mysql-client and php mysqli extension
RUN apt-get update && apt-get -y install mysql-client \
    && docker-php-source extract \
    && docker-php-ext-install mysqli \
    && docker-php-source delete \
    && rm -rf /var/lib/apt/lists/*

# Download Revive Adserver archive and decompress to /var/www/html
RUN curl -sSL "https://download.revive-adserver.com/revive-adserver-$REVIVE_VERSION.tar.gz" \
    | tar xz --strip-components=1 \
  	&& chmod -R a+w /var/www/html/var \
  	&& chmod -R a+w /var/www/html/var/cache \
  	&& chmod -R a+w /var/www/html/var/plugins \
  	&& chmod -R a+w /var/www/html/var/templates_compiled \
  	&& chmod -R a+w /var/www/html/plugins \
  	&& chmod -R a+w /var/www/html/www/admin/plugins \
  	&& chmod -R a+w /var/www/html/www/images

# define volume for ad-images
VOLUME /var/www/html/www/images

# setup startscript
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh
CMD ["/bin/bash", "/usr/local/bin/docker-entrypoint.sh"]
