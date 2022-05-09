# Domain Verification Process

* Aleff uses the `HTTP-01` verification method.
* The verification key and token are stored in Consul for the duration of the verification process.
* The `aleff-challenge-responder` component receives the verification request, looks up the key in Consul and returns the token stored there.
* Once the verification process is complete the key is removed from Consul.
* Note that verification takes place over a non-SSL connection on port `80`.
