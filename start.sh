#!/bin/sh -ex

certdir=/etc/letsencrypt/live/${MAILHOST}
privkey=${certdir}/privkey.pem
fullchain=${certdir}/fullchain.pem

# generate self signed certificate, if no certificate is available
test -e ${certdir} || \
    ( \
      mkdir -p ${certdir} \
          && chgrp ${SHARED_GROUP_NAME} ${certdir} \
          && chmod g+xrw ${certdir} \
    )
test -e ${privkey} || \
    ( \
      openssl genrsa -out ${privkey} 4096 \
          && chgrp ${SHARED_GROUP_NAME} ${privkey} \
          && chmod g+rw ${privkey} \
    )
test -e ${fullchain} || \
    ( \
      openssl req -new -x509 -subj "/CN=${MAILHOST}" -days ${DAYS} -key ${privkey} -out ${fullchain} \
          && chgrp ${SHARED_GROUP_NAME} ${fullchain} \
          && chmod g+rw ${fullchain} \
    )

postconf -e "smtpd_tls_key_file = ${privkey}"
postconf -e "smtpd_tls_cert_file = ${fullchain}"

/start-postfix.sh
