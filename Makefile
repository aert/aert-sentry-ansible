VERSION=6.4.1
SETUP_NAME=setup_sentry-$(VERSION)
SETUP_DIR=build/$(SETUP_NAME)

PIP_CACHE=./build/pip_cache

all: init wheel

wheel:
	# Clean	
	@rm -rf build/$(SETUP_NAME)*
	@mkdir -p $(SETUP_DIR)
	# Wheel	
	@pip wheel --wheel-dir=build/wheel/wheel-dir "sentry==$(VERSION)" --download-cache $(PIP_CACHE)
	@mv build/wheel/wheel-dir $(SETUP_DIR)/wheel-dir
	@rm -rf build/wheel/
	# TAR
	@cp installer/requirements.txt $(SETUP_DIR)
	@cp installer/Makefile $(SETUP_DIR)
	@sed -i 's/__VERSION__/$(VERSION)/g' $(SETUP_DIR)/Makefile
	@cd build; tar -czf $(SETUP_NAME).tgz $(SETUP_NAME)
	@rm -rf $(SETUP_DIR)

init:
	@pip install --upgrade pip setuptools
	@pip install "wheel==0.22.0" "ansible==1.4"
