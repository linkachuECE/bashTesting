#!/bin/bash

whoami
pwd
eval echo ~$linkachu
cat /etc/os-release | grep '^PRETTY_NAME=' | sed -e 's/^[^"]*"//' -e 's/"//'
w | sed -nr 's/([0-9]+ users)/\1/p'