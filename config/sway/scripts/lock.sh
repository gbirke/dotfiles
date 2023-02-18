#!/bin/sh

# A small shell script that collects the swaylock parameters

# TODO use pywal colors

# If we don't have a fancy swaylock version (that blurs and fades out),
# we could add screenshot+blur commands here.
# For the moment, we just use a background color 

swaylock \
  --indicator-caps-lock \
  --indicator-radius 160 \
  --indicator-thickness 20 \
  --color 443366ee \
  --daemonize

