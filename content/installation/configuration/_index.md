---
title: Configuration
weight: 20
disableToc: false
---

## Configuring Cabourotte

Cabourotte is configured through a YAML file (althought healthchecks can be dynamically configured using the API).

Here is a commented example of a Cabourotte configuration:

```yaml
---
# the http section is used to configure the Cabourotte HTTP server
http:
  # The HTTP server host
  host: "127.0.0.1"
  # The HTTP server port
  port: 9013
  # A cacert for mTLS (optional)
  cacert: "/tmp/cacert.pem"
  # A cert for mTLS (optional)
  cert: "/tmp/cert.pem"
  # A key for mTLS (optional)
  key: "/tmp/foo.key"
# The dns_checks section can be used to configure DNS healthchecks
dns_checks:
    # The healthcheck name
  - name: "mcorbin-dns-check"
    # The healthcheck description
    description: "dns healthcheck example"
    # The healthcheck domain
    domain: "mcorbin.fr"
    # The healthcheck interval
    interval: 5s
# The http_checks section can be used to configure HTTP healthchecks
http_checks:
    # The healthcheck name
  - name: "mcorbin-http-check"
    # The healthcheck description
    description: "http healthcheck example"
    # The list of HTTP status codes to consider the healthcheck successful
    valid_status:
      - 200
      - 201
    # The healthcheck target. It can be an IP (v4 or v6) or a domain
    target: "mcorbin.fr"
    # The target port
    port: 443
    # The protocol (http or https)
    protocol: "https"
    # The HTTP path of the healthcheck
    path: "/"
    # The healthcheck timeout
    timeout: 5s
    # The healthcheck interval
    interval: 10s
    # Follow redirect (optional, default false)
    redirect: true
    # Extra headers to add to the request (optional)
    headers:
      foo: "bar"
    # Body to pass to the request (optional)
      body: "my request body"
    # A list of regular expression. The response body should match them (optional)
    body_regexp
      - "foo!"
    # A cacert for mTLS (optional)
    cacert: "/tmp/cacert.pem"
    # A cert for mTLS (optional)
    cert: "/tmp/cert.pem"
    # A key for mTLS (optional)
    key: "/tmp/foo.key"
# The tcp_checks section can be used to configure HTTP healthchecks
tcp_checks:
    # The healthcheck name
  - name: "mcorbin-tcp-check"
    # The healthcheck description
    description: "tcp healthcheck example"
    # The healthcheck target. It can be an IP (v4 or v6) or a domain
    target: "mcorbin.fr"
    # The target port
    port: 443
    # The healthcheck timeout
    timeout: 2s
    # The healthcheck interval
    interval: 10s
# The exporters section can be used to configure exporters.
exporters:
  # a list of HTTP exporters
  http:
      # The exporter name
    - name: http-exporter
      # The exporter endpoint
      host: "127.0.0.1"
      # The exporter port
      port: 9595
      # The exporter path
      path: "/"
      # The exporter protocol (http or https)
      protocol: "http"
      # A cacert for mTLS (optional)
      cacert: "/tmp/cacert.pem"
      # A cert for mTLS (optional)
      cert: "/tmp/cert.pem"
      # A key for mTLS (optional)
      key: "/tmp/foo.key"
```

healthchecks names should be unique (you cannot have 2 healthchecks configured with the same name). Same for exporters.