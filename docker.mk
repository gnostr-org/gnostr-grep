## detect ARCH for buildx
ARCH                                   :=$(shell uname -m)
export ARCH
ifeq ($(ARCH),x86_64)
TARGET                                 :=amd64
export TARGET
endif
ifeq ($(ARCH),arm64)
TARGET                                 :=arm64
export TARGET
endif

DOCKER=$(shell which docker)
export DOCKER
PWD=$(shell echo `pwd`)
export PWD

default:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?##/ {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
-include Makefile

