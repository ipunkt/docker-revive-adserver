FROM php:7.0-apache
LABEL maintainer.name="ipunkt Business Solutions OHG"

ARG REVIVE_VERSION="4.0.2"

RUN curl -sSL "https://download.revive-adserver.com/revive-adserver-$REVIVE_VERSION.tar.gz" \
    | tar xz
