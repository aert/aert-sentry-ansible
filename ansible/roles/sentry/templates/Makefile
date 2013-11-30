CONF={{ app_home}}/sentry.conf.py
VENV={{ app_home}}/env

all: upgrade start

upgrade:
	. $(VENV)/bin/activate; sentry --config=$(CONF) upgrade

start:
	. $(VENV)/bin/activate; sentry --config=$(CONF) start
