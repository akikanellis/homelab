<!-- markdownlint-disable MD041 -->

<div align="center">
<h1>
    <img src="docs/images/logo.png" alt="Logo">
    <p>Homelab</p>
</h1>

Streamlined homelab setup with automated provisioning and updating of my
workstations and servers

[![Release](https://img.shields.io/github/v/release/akikanellis/homelab?style=flat-square)](https://github.com/akikanellis/homelab/releases)
[![Build](https://img.shields.io/github/actions/workflow/status/akikanellis/homelab/build-main.yml?style=flat-square)](https://github.com/akikanellis/homelab/actions/workflows/build-main.yml)

[About](#about)
•
[Getting Started](#getting-started)
•
[Contributing](#contributing)
•
[Security](#security)
•
[Support](#support)
•
[Authors & Contributors](#authors--contributors)
•
[License](#license)

![Demo](docs/images/demo.webp)
</div>

---

## About

A homelab setup that can provision and update my workstations, servers and
services they are hosting through the magic of infrastructure as code and a
fully automated, seamless CI/CD pipeline.

### Features

- [x] Infrastructure as code using
    [![Ansible](docs/images/ansible.svg) Ansible](https://www.ansible.com),
    [![Docker Compose](docs/images/docker.svg) Docker Compose](https://docs.docker.com/compose)
    and
    [![Jinja](docs/images/jinja.svg) Jinja](https://palletsprojects.com/p/jinja/)
- [x] Testing using
    [![Molecule](docs/images/molecule.svg) Molecule](https://molecule.readthedocs.io),
    [![Vagrant](docs/images/vagrant.svg) Vagrant](https://www.vagrantup.com)
    and
    [![VirtualBox](docs/images/virtualbox.svg) VirtualBox](https://www.virtualbox.org)
- [x] CI/CD using
    [![GitHub Actions](docs/images/github.svg) GitHub Actions](https://github.com/features/actions)
    with self-hosted runners
- [x] Network infrastructure using
    [![UniFi](docs/images/unifi.svg) UniFi](https://ui.com),
    [![Pi-hole](docs/images/pihole.svg) Pi-hole](https://pi-hole.net)
    and
    [![Nginx Proxy Manager](docs/images/nginx_proxy_manager.svg) Nginx Proxy Manager](https://nginxproxymanager.com)
- [x] Host hardening using
    [![DevSec Hardening](docs/images/devsec.svg) DevSec Hardening](https://dev-sec.io)
- [x] Observability and Monitoring using
    [![Netdata](docs/images/netdata.svg) Netdata](https://www.netdata.cloud),
    [![Graylog](docs/images/graylog.svg) Graylog](https://www.graylog.org),
    [![Grafana](docs/images/grafana.svg) Grafana](https://grafana.com),
    [![Prometheus](docs/images/prometheus.svg) Prometheus](https://prometheus.io),
    [![Elasticsearch](docs/images/elasticsearch.svg) Elasticsearch](https://www.elastic.co)
    and
    [![Portainer](docs/images/portainer.svg) Portainer](https://www.portainer.io)
- [x] Home automation using
    [![Home Assistant](docs/images/home_assistant.svg) Home Assistant](https://www.home-assistant.io)
    and
    [![Node-RED](docs/images/node_red.svg) Node-RED](https://nodered.org)

## Getting Started

### Prerequisites

Install the following software

- [just](https://github.com/casey/just)
- [asdf](https://github.com/asdf-vm/asdf)
- [![VirtualBox](docs/images/virtualbox.svg) VirtualBox](https://www.virtualbox.org)

### Usage

Install tools and dependencies

```shell
just install
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

## Contributing

To contribute, check out the [Contributing Guidelines](docs/CONTRIBUTING.md) and
the [Developers Guide](docs/DEVELOPERS_GUIDE.md). Thank you for being involved!

## Support

Need help? The [support page](docs/SUPPORT.md) can provide information on how to
get in touch.

## Security

You can refer to the [Security Policy](docs/SECURITY.md) for reporting
vulnerabilities and other security-related matters.

## Authors & Contributors

This project was created by [Aki Kanellis](https://github.com/akikanellis).

See the [contributors page](https://github.com/akikanellis/homelab/contributors)
for a complete list of all authors and contributors.

## License

This project is licensed under the **MIT license**.

See [LICENSE](LICENSE.txt) for more information.
