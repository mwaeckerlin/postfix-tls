FROM mwaeckerlin/smtp-relay as build
RUN addgroup postfix $SHARED_GROUP_NAME
RUN postconf -e 'smtpd_use_tls = yes'


FROM mwaeckerlin/scratch
ENV CONTAINERNAME "smtp-relay-tls"
ENV DAYS          "36525"
ENV MAILHOST      "localhost"

VOLUME /etc/letsencrypt
COPY --from=build / /
USER root
CMD postconf -e "smtpd_tls_cert_file = /etc/letsencrypt/live/${MAILHOST}/fullchain.pem" \
    && postconf -e "smtpd_tls_key_file = /etc/letsencrypt/live/${MAILHOST}/privkey.pem"  \
    && /usr/sbin/postfix start-fg