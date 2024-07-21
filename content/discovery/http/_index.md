---
title: HTTP
weight: 10
---

When this mode is used Cabourotte will periodically poll and endpoint which should return all healthchecks which should be configured.

The [configuration](/installation/configuration/) section shows how to enable HTTP service discovery in the configuration file.

The targeted HTTP server should return the healthchecks configurations as JSON. The fields are the same than the one in the YAML configuration file.

If the HTTP server returns for example this content:

```json
{
  "tcp-checks": [
    {
      "name": "mcorbin-http-check",
      "description": "http healthcheck example",
      "target": "mcorbin.fr",
      "interval": "5s",
      "timeout": "3s",
      "port": 443,
      "protocol": "https",
      "valid-status": [
        200
      ]
    }
  ],
  "dns-checks": [
    {
      "name": "mcorbin-dns-check",
      "description": "dns healthcheck example",
      "domain": "mcorbin.fr",
      "interval": "5s"
    }
  ]
}
```

Two healthchecks will be configured by Cabourotte.

Remember that all expected healthchecks should be returned by the HTTP server. If an healthcheck is not returned anymore by it, it will be deleted from Cabourotte.

See the [Appclacks server documentation](https://doc.appclacks.com/healthcheck/cabourotte/index.html) for an integration example.
