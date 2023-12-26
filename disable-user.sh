#!/bin/bash

lastlog -b 90|tail -n+2|awk '{print $1}'|xargs -I {} usermod -L {}
