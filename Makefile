.PHONY: init
init:
	go mod tidy

.PHONY: api
api:
	buf generate

.PHONY: lint
lint:
	buf lint

.PHONY: breaking
breaking:
	buf breaking --against '.git#branch=main'

.PHONY: deps
deps:
	buf dep update

.PHONY: all
all: lint api
