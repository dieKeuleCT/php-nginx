#!/bin/bash
# <dieKeuleCT>koehlmeier@gmail.com
# Script to handle the startup in our docker container.

service syslog start
nginx -g daemon off;
