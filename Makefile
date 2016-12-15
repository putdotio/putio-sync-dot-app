DMGBUILD := $(shell command -v dmgbuild 2> /dev/null)

all: build

check:
ifndef DMGBUILD
	$(error "dmgbuild is not available. pip install dmgbuild")
endif

build: check
	@mkdir build
	@xcodebuild -workspace Putio.xcworkspace -scheme Putio DSTROOT="build" archive
	@dmgbuild -s Data/dmg-settings.py Putio build/Applications/Putio.dmg
	@openssl dgst -sha1 -binary < build/Applications/Putio.dmg | openssl dgst -dss1 -sign ~/.ssh/putio_app_dsa_private.pem | openssl enc -base64
	@gstat -c "%s" build/Applications/Putio.dmg

clean:
	@rm -rf build/

.PHONY: all build check
