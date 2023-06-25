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
    "name": "dns-check",
    "summary": "DNS healthcheck example on appclacks.com",
    "success": true,
    "healthcheck-timestamp": 1687724429,
    "message": "success",
    "duration": 35,
    "source": "configuration"
  }
]
```

### Get result for a specific healthcheck

- **GET** /result/<name>

---

```
curl 127.0.0.1:9013/result/dns-check

{
  "name": "dns-check",
  "summary": "DNS healthcheck example on appclacks.com",
  "success": true,
  "healthcheck-timestamp": 1687724459,
  "message": "success",
  "duration": 144,
  "source": "configuration"
}
```
