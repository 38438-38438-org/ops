
# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test ./...
GOGET=$(GOCMD) get
BINARY_NAME=ops

all: deps test build

pre-build:

do-build: pre-build
	$(GOBUILD) -o $(BINARY_NAME) -v

post-build: do-build

build: post-build

pre-test:

do-test: pre-test
	$(GOTEST) -v

post-test: do-test

test: post-test

clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)

run:
	$(GOBUILD) -o $(BINARY_NAME) -v ./...
	./$(BINARY_NAME)

deps:
	dep ensure

.PHONY: all build test clean run deps
.PHONY: pre-build do-build post-build
.PHONY: pre-test do-test post-test

-include Makefile.local
