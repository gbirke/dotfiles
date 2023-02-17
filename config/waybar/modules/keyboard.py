#!/usr/bin/python

# This waybar module converts the keyboard layout name of an input
# using a lookup table. Its purpose is to transform similar layout
# names with variants, e.g. "German" and "German (US)"
#
# Copyright (C) 2023 by Gabriel Birke <gb@birke-software.de>

import subprocess
import sys
import json
from argparse import ArgumentParser

KEYBOARD_TABLE = {
    "German": "DE",
    "German (US)": "EN"
}

parser = ArgumentParser()
parser.add_argument("identifier")
args = parser.parse_args()

input_identifier = args.identifier

# We could use the i3ipc library instead, but that would create a
# dependency we'd have to install before using this module
result = subprocess.run(["swaymsg", "-t", "get_inputs", "-r"],
                        encoding="UTF-8", capture_output=True)

inputs = json.loads(result.stdout)
layout_name = ""
for input in inputs:
    if input["identifier"] == input_identifier:
        layout_name = input["xkb_active_layout_name"]

if layout_name == "":
    print("No layout found. check your identifier", file=sys.stderr)
    sys.exit(1)

if layout_name in KEYBOARD_TABLE:
    short_name = KEYBOARD_TABLE[layout_name]
    print(json.dumps({"text": short_name, "tooltip": layout_name}))
else:
    print(json.dumps({"text": layout_name}))
