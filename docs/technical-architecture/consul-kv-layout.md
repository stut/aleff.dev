# Consul KeyValue Layout

Aleff stores everything it needs in Consul. The location of each type of data is configurable through environment variables.

Unless you are already using the `certs/` root key you can safely use the defaults.

## Configuration

`KV_CONFIG_ROOT`

The private key and user registration information for Let's Encrypt is stored here. The keys include the ACME directory URL and the email address allowing both to be modified without trampling on each other. It also allows multiple instances of Aleff to be run with different configurations using the same Consul instance.

Default: `certs/config`

## Challenge tokens

`KV_CHALLENGE_ROOT`

The domain verification process involves responding to an HTTP request from Let's Encrypt with a token. The token is temporarily stored in this location in Consul. The `aleff-challenge-responder` has a matching environment variable from which it will read the token to respond to the request when it comes in.

Default: `certs/challenges`

## Certificates

`KV_CERT_ROOT`

Certificates that have been obtained from Let's Encrypt are stored here in such a way that Fabio can be configured to use this location as a certificate store.

Each certificate will store two keys here: `<domain>-key.pem` and `<domain>-cert.pem`.

Default: `certs/active`
