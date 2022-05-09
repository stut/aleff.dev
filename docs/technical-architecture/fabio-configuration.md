# Fabio Configuration

To configure Fabio to use the certificates obtained by Aleff is simply a case of pointing it at the right key in Consul.

With the default Aleff configuration this line is all that's required to configure Fabio:

```txt
proxy.cs = cs=consul;type=consul;cert=http://127.0.0.1:8500/v1/kv/certs/active
```

If you've changed the `KV_CERT_ROOT` option you'll need to adjust the Consul URL accordingly.

For further details on configuring Fabio certificate stores, including how to provide an ACL token, see [the Fabio documentation](https://fabiolb.net/feature/certificate-stores/#consul).
