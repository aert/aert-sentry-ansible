#!/bin/bash
set -e
CONF={{app_home}}/sentry.conf.py
VENV={{app_home}}/env
cd {{app_home}}
source $VENV/bin/activate
exec sentry --config=$CONF start http
