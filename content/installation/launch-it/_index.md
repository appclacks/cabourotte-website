---
title: Launch it
weight: 20
disableToc: false
---

## With the binary

You can launch the daemon with the command `cabourotte daemon --config <path_to_yaml_config>`.

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
    domain: "mcorbin.fr"
    interval: 3s
EOF
```

Then, launch Docker and mount this configuration file on the container:

```
docker run -v /tmp/cabourotte.yaml:/cabourotte.yaml mcorbin/cabourotte:v0.9.0
```
