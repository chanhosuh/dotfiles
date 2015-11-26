#! /bin/bash

# Run program unless it's already running.
# Mainly for autostart in Awesome 

if [ -z "`ps -Af | grep -o -w ".*$1" | grep -v grep | grep -v run-once`" ]; then
  $@
fi
