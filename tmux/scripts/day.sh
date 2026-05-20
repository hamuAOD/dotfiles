#!/bin/sh
date +%u | awk '{split("Mon Tue Wed Thu Fri Sat Sun", d); print d[$1]}'
