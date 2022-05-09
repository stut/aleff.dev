# Aleff Processor

View the project on [GitHub](https://github.com/stut/aleff) and [DockerHub](https://hub.docker.com/r/stut/aleff).

* Detects domains from `urlprefix-` (configurable) tags on services registered with Consul.
* For each one it will check to see if a certificate already exists.
* If not it will request a new one from Let's Encrypt.
* If it does it will check the expiry date and will renew if it's within the configured `RENEW_WITHIN` period.

## Use the internal timer

* The processor can be executed as a long-running service which checks for new and renewable domains based on an internal timer.
* Set the `RUN_INTERVAL` environment variable to a positive duration to enable this feature.
* The processor will run forever.

## Use an external timer

* By default the `RUN_INTERVAL` environment variable is set to `0`.
* In this mode Aleff will run once and exit.
* Run this periodically using an external timer such as `crond`, `systemd`, or as a `periodic` Nomad batch job.

## Access requirements

### Consul

* All data is stored in Consul.
* Aleff will need read/write access to [the keys in the configuration](../consul-kv-layout/).
* The Consul API URL and token (if required) should be provided in standard environment variables.
* We strongly recommend the token is provisioned using [Vault](https://www.vaultproject.io).

### Nomad

* Aleff requires the ability to launch the `aleff-challenge-responder` service.
* The Nomad API URL and token (if required) should be provided in the standard environment variables.
* We strongly recommend the token is provisioned using [Vault](https://www.vaultproject.io).
