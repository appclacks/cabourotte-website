---
title: HTTP
weight: 15
disableToc: false
---

The HTTP exporter allows you to push healthchecks results to an HTTP endpoint.

## Configuration

Exporters should be configured in the YAML configuration file. You can see how to configure the HTTP exporter in the [configuration](/installation/configuration/) section of the documentation

## Payload format

Here is an example payload sent by the HTTP exporter for a successful DNS healthcheck:

```json
[
  {
    "name": "mcorbin-dns-check",
    "summary": "dns healthcheck example on mcorbin.fr",
    "labels": {
      "environment": "prod"
    },
    "success": true,
    "timestamp": "2020-08-31T22:16:00.925315875+02:00",
    "message": "success"
  }
]
```

- `name` is the healthcheck name.
- `summary` is a small string with some information about the healthcheck.
- `success` indicates if the healthcheck was successful or not.
- `timestamp` is when the healthcheck was executed.
- `message` is a message containing `success` in case of a successful healthcheck, or an error message in case of a failure.

As you can see, the payload is a list of maps. Cabourotte may batch healthchecks result in the future.
