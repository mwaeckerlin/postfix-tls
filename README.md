Docker Image for Postfix with TLS
=================================

Configure with mail host name in `MAILHOST` and certificate duration in `DAYS`.

Expects two files in `/certs/${MAILHOST}`:
 - `privkey.pem`: the certificate's private key
 - `fullchain.pem`: the certificate's full chain
 
It creates a new key and a self signed certificate of duration `DAYS` days, if one or both of the files are missing.

Otherwise everything is inherited from [mwaeckerlin/postfix](https://github.com/mwaeckerlin/postfix).

This very basic image is intended to be used together with any other docker image that requires an SMTP server to send mails. E.g. I use it for [mwaeckerlin/nextcloud](https://hub.docker.com/r/mwaeckerlin/nextcloud), [mwaeckerlin/nodebb](https://hub.docker.com/r/mwaeckerlin/nodebb) or [gitea/gitea](https://hub.docker.com/r/gitea/gitea).

If you don't need `TLS`, just use [mwaeckerlin/smtp-relay](https://hub.docker.com/r/mwaeckerlin/smtp-relay).

See also:
 - [mwaeckerlin/smtp-relay](https://hub.docker.com/r/mwaeckerlin/smtp-relay) for a simple open mail relay
 - [mwaeckerlin/smtp-relay-tls](https://hub.docker.com/r/mwaeckerlin/smtp-relay-tls) for a simple open mail relay with tls
 - [mwaeckerlin/mailforward](https://hub.docker.com/r/mwaeckerlin/mailforward) for a simple mail forwarder without own inbox
 - [mwaeckerlin/postfix](https://hub.docker.com/r/mwaeckerlin/postfix) for a full featured postfix server
