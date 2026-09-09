---
description: "Package map for exposing the in-process agent over HTTP: the agent-http bundle + HTTP server plugin."
kind: "package-group"
---

# agent-http/ — HTTP agent server

English | [中文](README.zh.md)

## Summary

The `agent-http/` group exposes the agent running in the current dsh process over plain HTTP. The one package in this group is both a bundle and a plugin: stacked over `dsh-base`, it starts an HTTP server that drives the in-process agent and returns or streams the answer. This page maps the group; the package README owns the per-package contract.

## Table of Contents

- [Packages](#packages)
- [Dev Note](#dev-note)

-----

<a id="packages"></a>
## Packages

| Package | Role |
|---|---|
| [`agent-http/`](agent-http/README.md) | Bundle + plugin: HTTP `/run` and streaming `/run/stream` over the in-process agent |

-----

<a id="dev-note"></a>
## Dev Note

None.
