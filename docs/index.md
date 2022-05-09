# Welcome to Aleff

Aleff provides automated fetching and renewing of <a href="https://letsencrypt.org">Let's Encrypt</a> certificates for services registered in <a href="https://www.consul.io">Consul</a> and served via <a href="https://fabiolb.net">Fabio</a>.

This architecture is common with <a href="https://www.nomadproject.io">Nomad</a> and adding SSL is simply a matter of <a href="/nomad-quickstart/">deploying the Aleff job</a>.

By detecting <code>urlprefix-</code> (configurable) tags on services registered with Consul and extracting the domain names, Aleff will request or renew SSL certificates as required. The certificates are then stored in Consul in the format required by Fabio's Consul-based certificate store.

Note that Aleff currently only supports provisioning certificates for publicly-available domains; it does not support requesting certificates for internal services. This may be added as a feature in a future release.

## Features

* Easy deployment using official docker images.
* Fully automated; deploy and forget.
* Not tied to Nomad, compatible with any Consul/Fabio setup assuming you can configure the routing appropriately.

## Where should I go next?

* [Nomad quickstart](/nomad-quickstart/): Get started with Nomad
* [Technical architecture](/technical-architecture/): Read about the technical architecture
