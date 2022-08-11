#!/bin/bash

awk 'BEGIN{ FS = ":" }{print length($1) " " $1}' < /etc/passwd | sort -n -s | awk '{print $2}'