#!/bin/sh

ifconfig empower0 up
ovs-vsctl del-port br-ovs empower0
ovs-vsctl add-port br-ovs empower0

PORTS=$(ovs-ofctl show br-ovs | sed -n 's/\([0-9]*\)(\([0-9AZa-z]*\)): addr:\([0-9A-Za-z\:]*\).*/\3 \1 \2/p')
write_handler el.ports $PORTS
