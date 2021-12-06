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

- `healthcheck_duration_seconds_bucket`: The duration for the healthchecks executions. Labels are `status`, which indicates if the healthchecks were successful or not, and `name` which is the healthcheck name.
- `healthcheck_duration_seconds_count`: The number of execution for each healthchecks. Labels are the same than the previous metric.

**API**

- `http_requests_duration_second_bucket`: The duration of HTTP requests. Labels are `method`, which is the HTTP method of the request, and `path` which is the HTTP path of the request.
- `http_requests_duration_second_count`: The number of HTTP requests. Labels are the same than the previous metric.
- `http_responses_total`: A counter for HTTP responses Labels are `method`, `path` and also `status`, which is the response HTTP status.

**Go metrics**

Metrics prefixed by `go` are golang internal metrics.

## Kubernetes metrics

If you enable the [Kubernetes](discovery/kubernetes/) service discovery module, the metrics of the Kubernetes controllers will be available on `/discovery/kubernetes/metrics`.

## Health endpoints

Cabourotte provides the `/health` and `/healthz` endpoints. You can use them to check if Cabourotte is started or not.
