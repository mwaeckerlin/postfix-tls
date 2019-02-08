FROM mwaeckerlin/smtp-relay
MAINTAINER mwaeckerlin

ENV DAYS          "36525"

ENV CONTAINERNAME "smtp-relay-tls"
RUN apk add --no-cache --purge --clean-protected -u openssl \
 && addgroup postfix $SHARED_GROUP_NAME \
 && postconf -e 'smtpd_use_tls = yes'

VOLUME /etc/letsencrypt

