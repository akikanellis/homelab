<!-- markdownlint-disable MD041 -->

<div align="center">

# Developers Guide

[About](#about)
•
[Prerequisites](#prerequisites)
•
[Useful Commands](#useful-commands)

</div>

---

## About

This document describes setting up your development environment to build and
test this project.

## Prerequisites

Install the following software

- [just](https://github.com/casey/just)
- [rtx](https://github.com/jdx/rtx)
- [![VirtualBox](images/virtualbox.svg) VirtualBox](https://www.virtualbox.org)

## Useful Commands

List all commands

```shell
just
```

Install tools and dependencies

```shell
just install
```

Lint project

```shell
just lint
```

Run tests

```shell
just test
```

Create hosts locally

```shell
just up
```

Create and configure hosts locally

```shell
just run
```

Log in to a locally created host using `just login <HOST>`, replacing `<HOST>`
with the name of the host you want to access

```shell
just login server-pi
```

Remove locally created hosts

```shell
just down
```

Clean generated files

```shell
just clean
```
