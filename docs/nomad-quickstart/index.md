# Deploy to Nomad

Aleff was designed specifically for this architecture so it's the easiest confguration to deploy.

## Requirements

* Nomad configured to register services with Consul.
* Fabio deployed to proxy HTTP access to the services, listening on both port <code>80</code> and port <code>443</code>.
* Services with <code>urlprefix-</code> (or similar) tags specifying domain-based routing for Fabio.
* The main aleff processor job [requires access to both Consul and Nomad](../technical-architecture/aleff-processor/#access-requirements), and the aleff-challenge-responder job [requires access to Consul](../technical-architecture/aleff-challenge-responder/#access-requirements). For more details see the [technical architecture section](../technical-architecture/).

## Run frequency

Whether you use an external timer or the internal timer (see below) it's important to think about the best interval to use.

Once certificates have been initially obtained the ideal frequency is daily. However, new domains added will then take up to a day to be detected and SSL-enabled. If this is too long you can always force an execution of the job when you add a new domain via the Nomad API or UI.

## Deployment options

Aleff can be deployed as either a periodic batch job or a long-running service. The container itself has a very small footprint, only requiring 8Mhz of CPU and 16MB of memory. The only advantage to running as a batch job is that you can set the Docker image to <code>force_pull = true</code> with the <code>latest</code> tag to automatically use the latest stable release on each execution.

* [Deploy as a periodic batch job](batch/)
* [Deploy as a service job](service/)
