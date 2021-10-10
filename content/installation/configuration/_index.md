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
  # Basic auth for the HTTP server (optional)
  basic-auth:
    username: "my-username"
    password: "my-password"
  # Disable the healthcheck API (all the /healthcheck path), default false
  disable-healthcheck-api: false
  # Disable the result API (all the /result path and /frontend), default false
  disable-result-api: false
# The dns-checks section can be used to configure DNS healthchecks
dns-checks:
    # The healthcheck name
  - name: "mcorbin-dns-check"
    # The healthcheck description
    description: "dns healthcheck example"
    # The healthcheck domain
    domain: "mcorbin.fr"
    # The healthcheck interval
    interval: 5s
    # A list of IPs (v4 or v6) which will be compared to the
    # DNS lookup results. The healthcheck will fail if the IPs defined
    # in this list are not returned
    expected-ips:
      - 165.1.3.4
    # Labels for this healthcheck. It will be used in logging and in
    # exporters (optional)
    labels:
      environment: prod
# The http-checks section can be used to configure HTTP healthchecks
http-checks:
    # The healthcheck name
  - name: "mcorbin-http-check"
    # The healthcheck description
    description: "http healthcheck example"
    # The list of HTTP status codes to consider the healthcheck successful
    valid-status:
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
    # The HTTP method to use (optional, default GET. Possible values are POST, PUT, GET, HEAD)
    method: "GET"
    # Follow redirect (optional, default false)
    redirect: true
    # Extra headers to add to the request (optional)
    headers:
      foo: "bar"
    # Body to pass to the request (optional)
    body: "my request body"
    # A list of regular expression. The response body should match them (optional)
    body-regexp:
      - "foo!"
    # A cacert for mTLS (optional)
    cacert: "/tmp/cacert.pem"
    # A cert for mTLS (optional)
    cert: "/tmp/cert.pem"
    # A key for mTLS (optional)
    key: "/tmp/foo.key"
    # Enable or disable insecure TLS connections (default to false)
    insecure: false
    # The source IP which will be used for healthchecks (optional)
    source-ip: "10.1.1.2"
    # Labels for this healthcheck. It will be used in logging and in
    # exporters (optional)
    labels:
      environment: prod
# The tcp-checks section can be used to configure HTTP healthchecks
tcp-checks:
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
    # The source IP which will be used for healthchecks (optional)
    source-ip: "10.1.1.2"
    # If set to true, the healthcheck will be considered successful it the TCP
    # connection fails (optional, default to false)
    should-fail: true
    # Labels for this healthcheck. It will be used in logging and in
    # exporters (optional)
    labels:
      environment: prod
# the tls-checks section can be used to configure TLS healthchecks
tls-checks:
    # The healthcheck name
  - name: "mcorbin-tls-check"
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
    # The source IP which will be used for healthchecks (optional)
    source-ip: "10.1.1.2"
    # The SNI which will be used by the healthcheck (optional, default to the target value)
    server-name: example.com
    # Enable or disable insecure TLS connections (default to false)
    insecure: false
    # Verifies if the certificate expires in this delay (optional). The healthcheck will
    # fail if the certificat expires soon.
    # The format is the duration format of Golang: https://golang.org/pkg/time/#ParseDuration
    expiration-delay: 240h
    # A cacert for mTLS (optional)
    cacert: "/tmp/cacert.pem"
    # A cert for mTLS (optional)
    cert: "/tmp/cert.pem"
    # A key for mTLS (optional)
    key: "/tmp/foo.key"
    # Labels for this healthcheck. It will be used in logging and in
    # exporters (optional)
    labels:
      environment: prod
# the command-checks section can be used to configure commands on the machine
# hosting Cabourotte. The healthcheck will fail if the command status code is
# not zero
command-checks:
    # The healthcheck name
  - name: "mcorbin-command healthcheck"
    # The healthcheck description
    description: "tcp healthcheck example"
    # The healthcheck timeout
    timeout: 2s
    # The healthcheck interval
    interval: 10s
    # The command to execute
    command: "ls"
    # Arguments to pass to the command (optional)
    arguments:
      - "-l"
      - "/tmp"
    # Labels for this healthcheck. It will be used in logging and in
    # exporters (optional)
    labels:
      environment: prod
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
  # riemann.io or mirabelle.mcorbin.fr exporter
  riemann:
      # The exporter name
    - name: "mirabelle"
      # The exporter endpoint
      host: "89.145.167.133"
      # The exporter port
      port: 5555
      # the TTL for events
      ttl: "120s"
      # A cacert for mTLS (optional)
      cacert: "/tmp/cacert.pem"
      # A cert for mTLS (optional)
      cert: "/tmp/cert.pem"
      # A key for mTLS (optional)
      key: "/tmp/foo.key"
      # Enable or disable insecure TLS connections (default to false)
      insecure: false
```

healthchecks names should be unique (you cannot have 2 healthchecks configured with the same name). Same for exporters.
