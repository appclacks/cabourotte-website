---
title: Riemann/Mirabelle
weight: 20
disableToc: false
---

The HTTP exporter allows you to push healthchecks results to [Mirabelle](https://www.mirabelle.mcorbin.fr/) or [Riemann](http://riemann.io/)

## Configuration

Exporters should be configured in the YAML configuration file. You can see how to configure the HTTP exporter in the [configuration](/installation/configuration/) section of the documentation

## Payload format

The event will have several fields set:

- host: The hostname of the machine where Cabourotte is running.
- metric: the health check execution time in milliseconds.
- service: The valie will be "cabourotte-healthcheck".
- description: A summary of the healthcheck and a message explaining the healthcheck result.
- time: The healthcheck execution timestamp.
- state: The healthcheck state ("ok" or "critical")
- tags: The event will be tagged "cabourotte"
- ttl: The TTL configured in the configuration.
- healthcheck: The healthcheck name

The healthchecks labels will also be set in the event.
