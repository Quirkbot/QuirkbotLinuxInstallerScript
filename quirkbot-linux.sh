#!/bin/bash
# Quirkbot support to Linux

# Step one: make sure user can access serial port
# (This is done by adding the user to the same group that owns /dev/ttyS0)
sudo gpasswd -a `whoami` $(ls -l /dev/* | grep /dev/ttyS0 |awk '{print $4}');

# Step two: add udev rules for Quirkbot devices
sudo echo \
"# Quirkbot
ATTRS{product}==\"Quirkbot*\", ENV{ID_MM_DEVICE_IGNORE}=\"1\"
SUBSYSTEM==\"tty\" ATTRS{product}==\"Quirkbot*\" SYMLINK+\"quirkbot%n\"" \
> /etc/udev/rules.d/99-quirkbot.rules
