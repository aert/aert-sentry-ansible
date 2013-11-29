VERSION=6.3.3

PIP_CACHE=./build/pip_cache

wheel:
	# Clean	
	@mkdir -p build/installer
	@mkdir -p build/setup_sentry-$(VERSION)
	@mkdir -p build/installer
	# Wheel	
	@pip wheel --wheel-dir=build/wheel/wheel-dir "sentry==$(VERSION)" --download-cache $(PIP_CACHE)
	@mv build/wheel/wheel-dir build/setup_sentry-$(VERSION)/wheel-dir
	@rm -rf build/wheel/
	# TAR
	@cd build; tar -czf setup_sentry-$(VERSION).tgz setup_sentry-$(VERSION)/

init:
	@pip install --upgrade pip setuptools
	@pip install "wheel==0.22.0"
