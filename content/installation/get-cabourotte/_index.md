---
title: Get or build Cabourotte
weight: 15
disableToc: false
---

## Download a release from Github

You can download a release from [Github](https://github.com/mcorbin/cabourotte/releases).

## Build Cabourotte

In order to build Meuse, you need to install [Golang](https://golang.org/).

Then, clone the Cabourotte repository and execute `go build -mod vendor`. The resulting binary named `cabourotte` will be created at the root of the project.

## Using Docker

A Dockerfile is available at the root of the repository.

If you want to try Cabourotte using Docker, you can check the [Launch It](/installation/launch-it/) section.
