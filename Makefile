.PHONY: build test run clean

GO := go
BIN_WEBSERVER := ga
BUILD_PATH := ./cmd/ga
ENVFLAGS = GO111MODULE=on CGO_ENABLED=0 GOOS=$(shell go env GOOS) GOARCH=$(shell go env GOARCH)

## usage: show available actions
usage: Makefile
	@echo  "to use make call:"
	@echo  "    make <action>"
	@echo  ""
	@echo  "list of available actions:"
	@if [ -x /usr/bin/column ]; \
	then \
		echo "$$(sed -n 's/^## /    /p' $< | column -t -s ':')"; \
	else \
		echo "$$(sed -n 's/^## /    /p' $<)"; \
	fi

## build: build server
build:
	@echo "==> Building binary (bin/$(BIN_WEBSERVER))..."
	$(ENVFLAGS) $(GO) build -v -o bin/$(BIN_WEBSERVER) $(BUILD_PATH)

## test: run unit tests
test:
	@echo  "==> Running tests in all current directories and subdirectories:"
	$(GO) test -v -race -cover ./...

## run: run server
run:
	@echo "==> Running server:"
	./bin/$(BIN_WEBSERVER) $(args)

## clean: clean local binaries
clean:
	@echo  "==> Running clean..."
	@rm -rf bin/$(BIN_WEBSERVER)
	@echo  "App clear! :)"