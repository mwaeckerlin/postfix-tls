Docker Image for Postfix with TLS
=================================

Configure with mail host name in `MAILHOST` and certificate duration in `DAYS`.

Expects two files in `/certs/${MAILHOST}`:
 - `privkey.pem`: the certificate's private key
 - `fullchain.pem`: the certificate's full chain
 
It creates a new key and a self signed certificate of duration `DAYS` days, if one or both of the files are missing.

Otherwise everything is inherited from [mwaeckerlin/postfix](https://github.com/mwaeckerlin/postfix).
