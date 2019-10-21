FROM php:7.3-fpm-alpine

MAINTAINER Jan Wagner <waja@cyconet.org>

ARG BUILD_DATE
ARG BUILD_VERSION
ARG VCS_URL
ARG VCS_REF
ARG VCS_BRANCH

# See http://label-schema.org/rc1/ and https://microbadger.com/labels
LABEL org.label-schema.name="PHP 7.3 - FastCGI Process Manager" \
    org.label-schema.description="PHP-FPM 7.3 (with some more extentions installed)" \
    org.label-schema.vendor="Cyconet" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date="${BUILD_DATE:-unknown}" \
    org.label-schema.version="${BUILD_VERSION:-unknown}" \
    org.label-schema.vcs-url="${VCS_URL:-unknown}" \
    org.label-schema.vcs-ref="${VCS_REF:-unknown}" \
    org.label-schema.vcs-branch="${VCS_BRANCH:-unknown}"

RUN set -xe; \
  docker-php-ext-install mysqli \
  # Cleanup build deps
  #  8 # clean up build deps
  && rm -rf /tmp/* /var/cache/apk/*
