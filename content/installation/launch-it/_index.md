---
title: Launch it
weight: 20
disableToc: false
---

## With the binary

Releases are available [on Github](https://github.com/appclacks/cabourotte/releases).

You can launch the daemon with the command `cabourotte daemon --config <path_to_yaml_config>`.

You can also pass a `--debug` flag to enable debug login.

## With Docker

You should first create a [configuration file](/installation/configuration/), for example:

```
cat <<EOF > /tmp/cabourotte.yaml
http:
  host: "0.0.0.0"
  port: 9013
dns-checks:
  - name: "dns-check"
    description: "example"
    domain: "appclacks.com"
    timeout: 5s
    interval: 10s
EOF
```

Then, launch Docker and mount this configuration file on the container:

```
docker run -p 9013:9013 -v /tmp/cabourotte.yaml:/cabourotte.yaml appclacks/cabourotte:v1.17.0
```
