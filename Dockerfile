FROM mwaeckerlin/smtp-relay
MAINTAINER mwaeckerlin

ENV DAYS          "36525"

ENV CONTAINERNAME "smtp-relay-tls"
RUN apk add --no-cache --purge --clean-protected -u openssl \
 && addgroup postfix $SHARED_GROUP_NAME \
 && postconf -e 'smtpd_use_tls = yes'

VOLUME /etc/letsencrypt

# definitions for our children
ONBUILD RUN mv start.sh start-postfix-tls.sh
ONBUILD ADD start.sh /start.sh
