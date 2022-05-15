# Configuration

Aleff is configured through environment variables.

## EMAIL_ADDRESS

Specify an email address at which you want to receive [expiration notifications](https://letsencrypt.org/docs/expiration-emails/) in case Aleff fails to renew a certificate. As of writing this documentation they do this 20 days before expiry giving you plenty of time to diagnose and fix the problem.

While Let's Encrypt allows certificates to be requested without an email address Aleff requires one to ensure you are aware if renewal is failing.

Default: _none_ (required)

## CHALLENGE_RESPONDER_JOB_FILENAME

This is the filename of the `aleff-challenge-responder` service job definition.

Default: _none_ (required)

## RUN_INTERVAL

This variable defines how frequently Aleff should check for new domains and domains to renew. Valid intervals consist of a positive number followed by a units suffix. Valid units are `h`, `m` and `s`.

Examples:
* `5m`
* `1h`
* `1h30m`
* `24h`

If this variable is set to `0` Aleff will run once and exit.

Default: `0`

## RENEW_WITHIN

This variable defines how long before expiry a certificate will be renewed. It has the same syntax as `RUN_INTERVAL`. Note that the default is based on [Let's Encrypt recommendations](https://letsencrypt.org/docs/faq/#what-is-the-lifetime-for-let-s-encrypt-certificates-for-how-long-are-they-valid).

Default: `696h` (29 days)

## CHALLENGE_RESPONDER_JOB_TIMEOUT

Specifies how long aleff will wait for the challenge responder job to start responding correctly to the challenge request. Uses the same duration semantics as `RUN_INTERVAL`.

Default: `1m` (1 minute)

## TAG_PREFIX

If you're using a non-standard prefix for Fabio routing tags, specify it here.

Default: `urlprefix-`

## Consul KeyValue keys

Aleff stores everything it needs in Consul and the location of this data can be modified through several environment variables.

See the [Consul Layout](../consul-kv-layout/) page for details.
