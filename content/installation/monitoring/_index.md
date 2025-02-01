---
title: Monitoring
weight: 25
disableToc: false
---

## Metrics

Cabourotte exposes various metrics about itself and about healthchecks on the `/metrics` endpoint using the Prometheus format.

Here are some interesting metrics exposed:

**exporters**

- `exporter_duration_seconds_bucket`: The duration for the healthchecks exporters. Labels are `status`, which indicates if healthchecks were exported successfully or not, and `name` which is the exporter name.
- `exporter_duration_seconds_count`: The number of events exported to exporters. The labels are the same than the previous metric.
- `result_chan_size`: Healthchecks results are pushed into a Golang channel. The size of the channel is limited. This metric indicates the channel size. If healthchecks are not pushed fast enough to the exporters, this channel could be full.

**healthchecks**

- `healthcheck_duration_seconds_bucket`: The duration for the healthchecks executions. This metric has a `name` label which is the healthcheck name.
- `healthcheck_duration_seconds_count`: The number of execution for each healthchecks. It also have a `name` label.

**API**

- `http_requests_duration_second_bucket`: The duration of HTTP requests. Labels are `method`, which is the HTTP method of the request, and `path` which is the HTTP path of the request.
- `http_requests_duration_second_count`: The number of HTTP requests. Labels are the same than the previous metric.
- `http_responses_total`: A counter for HTTP responses Labels are `method`, `path` and also `status`, which is the response HTTP status.

**Discovery**

- `http_discovery_duration_seconds_bucket`: The duration of HTTP discovery requests, as a Prometheus histogram
- `http_discovery_responses_total`: A counter counting the number of HTTP discovery responses. It provides a `status` label (`success` or `failure`).

**Go metrics**

Metrics prefixed by `go` are golang internal metrics.

## Tracing

You can enable [Opentelemetry traces](https://opentelemetry.io/docs/concepts/signals/traces/). You can for example use the `OTEL_EXPORTER_OTLP_TRACES_ENDPOINT` to configure the endpoint. See the [environment variable list](https://opentelemetry.io/docs/specs/otel/configuration/sdk-environment-variables/) in the Opentelemetry documentation.

## Health endpoints

Cabourotte provides the `/health` and `/healthz` endpoints. You can use them to check if Cabourotte is started or not.
