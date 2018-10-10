FROM mwaeckerlin/postfix
MAINTAINER mwaeckerlin

ENV MAILHOST      "postfix"
ENV DAYS          "36525"

ENV CONTAINERNAME "postfix"
ADD start.sh /start.sh
RUN apk update \
 && apk add openssl \
 && postconf -e 'smtpd_use_tls = yes'

VOLUME /certs
