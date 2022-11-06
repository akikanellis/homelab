from __future__ import absolute_import, division, print_function

__metaclass__ = type

import socket

from ansible.errors import AnsibleParserError
from ansible.plugins.inventory import BaseInventoryPlugin
from ansible.plugins.loader import inventory_loader

DOCUMENTATION = r"""
    name: reachable
    plugin_type: inventory
    short_description: Removes unreachable hosts from a YAML inventory
    description: Removes unreachable hosts from a YAML inventory
    options:
        plugin:
            description: Name of the plugin
            required: true
            choices: ['reachable']
        inventory_file:
            description: Location of the YAML inventory
            required: true
"""


def _host_address(host):
    if "ansible_host" in host.get_vars():
        return host.get_vars()["ansible_host"]
    else:
        return host.address


def _host_port(host):
    if "ansible_port" in host.get_vars():
        return host.get_vars()["ansible_port"]
    else:
        return 22


class InventoryModule(BaseInventoryPlugin):
    NAME = "reachable"

    def verify_file(self, path):
        return super(InventoryModule, self).verify_file(path) and path.endswith(
            ("reachable.yml", "reachable.yaml")
        )

    def parse(self, inventory, loader, path, cache=True):
        super(InventoryModule, self).parse(inventory, loader, path, cache)

        self._read_config_data(path)

        self._parse_with_yaml_inventory_plugin(inventory, loader, cache)

        unreachable_hosts = self._find_unreachable_hosts()
        self._remove_unreachable_hosts(unreachable_hosts)

    def _parse_with_yaml_inventory_plugin(self, inventory, loader, cache):
        yaml_inventory_plugin = inventory_loader.get("yaml")
        yaml_inventory_plugin.parse(
            inventory, loader, self.get_option("inventory_file"), cache
        )

    def _find_unreachable_hosts(self):
        unreachable_hosts = []

        for hostname in self.inventory.hosts:
            host = self.inventory.get_host(hostname)
            host_address = _host_address(host)
            host_port = _host_port(host)

            self.display.display(
                f"Checking if host '{host}'"
                f" is reachable on"
                f" '{host_address}:{host_port}'"
            )

            host_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            host_socket.settimeout(1)

            try:
                host_socket.connect((host_address, host_port))
                self.display.display(f"Successfully reached host '{host}'")
            except (ConnectionError, socket.timeout):
                self.display.warning(
                    f"Host '{host}' is temporarily unreachable,"
                    " will be removing host from the inventory."
                )
                unreachable_hosts.append(host)
            except Exception as e:
                raise AnsibleParserError(
                    f"Received unexpected error '{e}'"
                    f" while trying to reach host '{host}'."
                )
            else:
                host_socket.close()

        return unreachable_hosts

    def _remove_unreachable_hosts(self, unreachable_hosts):
        for host in unreachable_hosts:
            self.display.display(f"Removing host '{host}' from the inventory")
            self.inventory.remove_host(host)
