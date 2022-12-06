---
title: Result
weight: 5
disableToc: false
---

The **latest** result for each healthcheck can be retrieved through the API.

### List results

- **GET** /result

---

```
curl 127.0.0.1:9013/result

[
  {
    "name": "mcorbin-dns-check",
    "configuration": {
      "name": "mcorbin-dns-check",
      "description": "dns healthcheck example",
      "domain": "mcorbin.fr",
      "interval": "10s",
      "timeout": "5s",
      "one-off": false
    },
    "success": true,
    "timestamp": "2020-07-06T20:05:37.110843227+02:00",
    "message": "success"
  },
  {
    "name": "mcorbin-tcp-check",
    "configuration": {
      "name": "mcorbin-tcp-check",
      "description": "http healthcheck example",
      "target": "mcorbin.fr",
      "port": 443,
      "timeout": "3s",
      "interval": "5s",
      "one-off": false
    },
    "success": true,
    "timestamp": "2020-07-06T20:05:34.530064698+02:00",
    "message": "success"
  }
]
```

### Get result for a specific healthcheck

- **GET** /result/<name>

---

```
curl 127.0.0.1:9013/result/mcorbin-dns-check

{
  "name": "mcorbin-dns-check",
  "configuration": {
    "name": "mcorbin-dns-check",
    "description": "dns healthcheck example",
    "domain": "mcorbin.fr",
    "interval": "10s",
    "timeout": "5s",
    "one-off": false
  },
  "success": true,
  "timestamp": "2020-07-06T20:06:07.627571385+02:00",
  "message": "success"
}
```
