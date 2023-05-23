# Missing features / Next steps

## Machine-Specific configurations
Currently, the waybar config is specific to my Thinkpad T14 notebook.

Extend startup script to use jq to merge common JSON and machine-specific JSON into `~/.config/waybar/config` file.

## Network traffic
Display accumulated upload / download speeds of all network interfaces.
Can't be bothered with configuring a host-specific network interface at
the moment. Might build my own based on [nicstat](https://manpages.ubuntu.com/manpages/trusty/man1/nicstat.1.html)

## Swap percentage
Unfortunately the waybar version on Ubuntu
22.04 (0.9.9) does not support swap percentage.

## Show info in scratchpad terminal on click
e.g `top`, `cal`, etc.
