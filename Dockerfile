FROM mwaeckerlin/postfix
MAINTAINER mwaeckerlin

ENV MAILHOST      "postfix"
ENV DAYS          "36525"

ENV CONTAINERNAME "postfix"
RUN apk update \
 && apk add openssl \
 && addgroup postfix $SHARED_GROUP_NAME \
 && postconf -e 'smtpd_use_tls = yes'

VOLUME /certs
