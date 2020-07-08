---
title: Healthcheck
weight: 5
disableToc: false
---

## Creating healthchecks

Cabourotte provides several endpoints to create various kind of healthchecks. The payload is formatted as json, and should be a valid healthcheck definition.

The availables options for healthchecks are exactly the same than the one described in the [configuration](/installation/configuration/) section.

If the parameter `one-off` is set to `true` in the payload, the healthcheck will be instantly executed and the result will be returned in the HTTP response (an example is available on this page). In that case, the healthcheck will **not** be periodically executed.

### Create a HTTP healthcheck

- **POST** /healthcheck/http

---

```
curl -H "Content-Type: application/json" 127.0.0.1:9013/healthcheck/http -d '{"name":"mcorbin-http-check","description":"http healthcheck example","target":"mcorbin.fr","interval":"5s","timeout": "3s","port":443,"protocol":"https","valid-status":[200]}'

{"message":"Healthcheck successfully added"}
```

### Create a TCP healthcheck

- **POST** /healthcheck/tcp

---

```
curl -H "Content-Type: application/json" 127.0.0.1:9013/healthcheck/tcp -d '{"name":"mcorbin-tcp-check","description":"http healthcheck example","target":"mcorbin.fr","interval":"5s","timeout": "3s","port":443}'

{"message":"Healthcheck successfully added"}

```

### Create a DNS Healthcheck

- **POST** /healthcheck/dns

---

```
curl -H "Content-Type: application/json" 127.0.0.1:9013/healthcheck/dns -d '{"name":"mcorbin-dns-check","description":"dns healthcheck example","domain":"mcorbin.fr","interval":"5s"}'

{"message":"Healthcheck successfully added"}
```

### Create a One-Off healthcheck

As explained before, the `one-off` parameter can be set to `true` in the payload to create a `one-off` healthcheck which will be instantly executed.

---

**Success example**:

```
curl -H "Content-Type: application/json" 127.0.0.1:9013/healthcheck/dns -d '{"name":"mcorbin-dns-check","description":"dns healthcheck example","domain":"mcorbin.fr","interval":"5s","one-off": true}'

{"message":"One-off healthcheck mcorbin-dns-check successfully executed"}
```

**Error example**:

```
curl -H "Content-Type: application/json" 127.0.0.1:9013/healthcheck/dns -d '{"name":"mcorbin-dns-check","description":"dns healthcheck example","domain":"doesnotexist.mcorbin.fr","interval":"5s","one-off": true}'

{"message":"Execution of one off healthcheck mcorbin-dns-check failed: Fail to lookup IP for domain: lookup doesnotexist.mcorbin.fr on 192.168.43.1:53: no such host"}
```

### Delete a healthcheck

- **DELETE** /healthcheck/<name>

---

```
curl -X DELETE 127.0.0.1:9013/healthcheck/mcorbin-dns-check

{"message":"Successfully deleted healthcheck mcorbin-dns-check"}
```

### List healthchecks

- **GET** /healthcheck

---

```
curl 127.0.0.1:9013/healthcheck

[
  {
    "name": "mcorbin-dns-check",
    "description": "dns healthcheck example",
    "domain": "mcorbin.fr",
    "interval": "5s",
    "one-off": false
  },
  {
    "name": "mcorbin-http-check",
    "valid-status": [
      200
    ],
    "description": "http healthcheck example",
    "target": "mcorbin.fr",
    "port": 443,
    "redirect": false,
    "headers": null,
    "protocol": "https",
    "path": "",
    "body-regexp": null,
    "timeout": "3s",
    "interval": "5s",
    "one-off": false
  }
]
```

### Get a healthcheck

- **GET** /healthcheck/<name>

---

```
curl 127.0.0.1:9013/healthcheck/mcorbin-dns-check

{
  "name": "mcorbin-dns-check",
  "description": "dns healthcheck example",
  "domain": "mcorbin.fr",
  "interval": "5s",
  "one-off": false
}
```
