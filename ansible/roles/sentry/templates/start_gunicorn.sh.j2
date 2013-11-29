#!/bin/bash
set -e
LOGFILE={{ app_log }}/gunicorn.log
LOGDIR=$(dirname $LOGFILE)
NUM_WORKERS=3
# user/group to run as
USER=root
GROUP=root
PORT=8061
IP=0.0.0.0
SITE={{ app_env }}
cd $SITE
source ./bin/activate
export APP_CONFIG_ASSETS={{ app_home}}/config.ini
test -d $LOGDIR || mkdir -p $LOGDIR
exec ./bin/gunicorn -b $IP:$PORT -w $NUM_WORKERS \
  --user=$USER --group=$GROUP --log-level=debug --log-file=$LOGFILE \
  assets.webui.wsgi:application 2>>$LOGFILE
