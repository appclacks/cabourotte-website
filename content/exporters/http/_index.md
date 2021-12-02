---
title: HTTP
weight: 15
disableToc: false
---

The HTTP exporter allows you to push healthchecks results to an HTTP endpoint.

## Configuration

Exporters should be configured in the YAML configuration file. You can see how to configure the HTTP exporter in the [configuration](/installation/configuration/) section of the documentation

## Payload format

Here is an example payload sent (using HTTP POST) by the HTTP exporter for a successful DNS healthcheck:

```json
[
  {
    "name": "mcorbin-dns-check",
    "summary": "dns healthcheck example on mcorbin.fr",
    "labels": {
      "environment": "prod"
    },
    "success": true,
    "healthcheck-timestamp": 1610744658,
    "message": "success",
    "source": "configuration"
  }
]
```

- `name` is the healthcheck name.
- `summary` is a small string with some information about the healthcheck.
- `success` indicates if the healthcheck was successful or not.
- `healthcheck-timestamp` is when the healthcheck was executed.
- `message` is a message containing `success` in case of a successful healthcheck, or an error message in case of a failure.
- `source` is the component which created the healthcheck (api, configuration...).

As you can see, the payload is a list of maps. Cabourotte may batch healthchecks result in the future.
