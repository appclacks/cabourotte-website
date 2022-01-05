---
title: Kubernetes
weight: 10
---

The Kubernetes service discovery mechanisms allows Cabourotte to automatically configure itself based on Kubernetes pods and services annotations.

Cabourotte also listens for a Custom Resource Definition (CRD) to configure healthcheck using Kubernetes resources.

The [configuration](/installation/configuration/) section shows how to enable Kubernetes service discovery in the configuration file.

Cabourotte should be allowed to listen to pods, services, and the Cabourotte Healthcheck CRD in order to make the service discovery mechanism to work.

You can for example apply in your cluster this [manifest](https://github.com/mcorbin/cabourotte/blob/master/doc/kubernetes/cabourotte_rbac.yaml) in order to have a Kubernetes `ClusterRole` created with the right permissions and associated to a `ServiceAccount` in the namespace `default`.

This [manifest](https://github.com/mcorbin/cabourotte/blob/master/doc/kubernetes/cabourotte_deployment.yaml) shows you to deploy Cabourotte using a Kubernetes `Deployment`.

You will also have to create the Kubernetes `Custom Resource Definition` using [this manifest](https://github.com/mcorbin/cabourotte/blob/master/doc/kubernetes/healthcheck_crd.yaml).

You can use multiple instances of Cabourotte in parallel, each watching one or multiple resources (which can be filtered using labels) to configure themselves.

## Cluster access

Cabourotte needs to access the Kubernetes API server. There are several ways to configure the access, which are tried in this order:

- A KUBECONFIG environment variable pointing to a kubeconfig file.
- If you are running Cabourotte inside kubernetes, Cabourotte automatically use the pod service account.
- use the kubeconfig at `$HOME/.kube/config`.

## Pods and services

Cabourotte can listen to pods and services to configure healthchecks. The configuration file allows you to restrict which pods and services should be listened based on their labels or namespaces.

Annotations are used to configure healthchecks.

**Pods**

The `cabourotte.mcorbin.fr/healthcheck-type` and `cabourotte.mcorbin.fr/healthcheck-configuration` annotations are required to configure healthchecks.

The first one indicates the healthcheck type (`http`, `tcp`, `dns`, `tls`, `command`) and the second one contains the healthcheck configuration in YAML format. The format is the same that the one described in the [configuration](/installation/configuration/) file.

Here is an example:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: test-http-check
  annotations:
    cabourotte.mcorbin.fr/healthcheck-type: "http"
    cabourotte.mcorbin.fr/healthcheck-configuration: |
      name: "foo"
      description: "bar"
      interval: "5s"
      timeout: "3s"
      port: 443
      protocol: "https"
      valid-status: [200]
```

These annotations will configure for this pod an healthcheck of type `http`.

The healthcheck `target` is not defined in the configuration. You can define it but by default the target will be the Kubernetes pod IP address (the IP set in `Status.PodIP` in the pod spec).

**Service**

The annotations are the same than the pods one. `cabourotte.mcorbin.fr/healthcheck-type` should be used to configure the healthcheck type, and `cabourotte.mcorbin.fr/healthcheck-configuration` for the healthcheck configuration.

By default, the healthcheck target will be the service DNS (`<service-name>.<namespace>.svc`). You can also target the service Cluster IP (`Spec.ClusterIP` in the service spec) by adding a new annotation to your service: `cabourotte.mcorbin.fr/target: "ip"`.

## CRD

You can also configure Cabourotte healthchecks using a Kubernetes Custom Resource Definition. Like Pods and Services, you can configure which namespace to watch (default to all) and only listen to resources with specific labels.

You can find a resource example [here](https://github.com/mcorbin/cabourotte/blob/master/doc/kubernetes/healthcheck_example.yaml). The format is simple: it's the same than the [configuration](/installation/configuration/) one for healhchecks.

For example:

```yaml
apiVersion: cabourotte.mcorbin.fr/v1
kind: Healthcheck
metadata:
  name: healthcheck-sample
  namespace: default
  labels:
    foo: "bar"
spec:
  dns-checks:
    - name: "mcorbin-dns-check"
      description: "dns healthcheck example"
      domain: "mcorbin.fr"
      interval: "5s"
      labels:
        environment: prod
```

This resource will configure Cabourotte with an healthcheck of type `dns`.
