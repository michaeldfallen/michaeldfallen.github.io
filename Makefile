.PHONY: build test

define compose
	docker-compose $(1)
endef

all: build run

build:
	$(call compose, build --pull)

run:
	$(call compose, run --service-ports dev)
