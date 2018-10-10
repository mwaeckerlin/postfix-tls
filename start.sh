#!/bin/sh -ex

name=${MAILHOST:-postfix}
certdir=/certs/${name}
privkey=${certdir}/privkey.pem
fullchain=${certdir}/fullchain.pem

# generate self signed certificate, if no certificate is available
test -e ${certdir}   || mkdir -p ${certdir}
test -e ${privkey}   || openssl genrsa -out ${privkey} 4096
test -e ${fullchain} || openssl req -new -x509 -subj "/CN=${name}" -days ${DAYS} -key ${privkey} -out ${fullchain}

postconf -e "smtpd_tls_key_file = ${privkey}"
postconf -e "smtpd_tls_cert_file = ${fullchain}"

postconf -e "myhostname = ${name}"

rsyslogd
postfix start
tail -f /var/log/maillog
