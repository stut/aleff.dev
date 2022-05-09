# Aleff Challenge Responder

View the project on [GitHub](https://github.com/stut/aleff-challenge-responder) and [DockerHub](https://hub.docker.com/r/stut/aleff-challenge-responder).

* All requests via Fabio to `/.well-known/acme-challenge/` must be routed to this component so the correct response is given to Let's Encrypt's HTTP-01 challenge requests.
* In a Nomad-based deployment this will be handled automatically.

## Access requirements

### Consul

* All data is stored in Consul.
* Fabio will need read access to [the active certs key in the configuration](../consul-kv-layout/).
* The Consul API URL and token (if required) should be provided in [the Fabio certificate store configueration](https://fabiolb.net/feature/certificate-stores/#consul).
* We strongly recommend the token is provisioned using [Vault](https://www.vaultproject.io).
