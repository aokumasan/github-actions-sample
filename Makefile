ifndef GOBIN
GOBIN=$(shell pwd)/bin
endif

TOOLS=\
	github.com/golangci/golangci-lint/cmd/golangci-lint@v1.49.0 \
	golang.org/x/tools/cmd/goimports@latest \
	github.com/google/go-licenses@latest

.PHONY: build
build:
	go build -o sample main.go

.PHONY: test
test:
	go test ./...

.PHONY: lint
lint:
	$(GOBIN)/golangci-lint run

.PHONY: image
image:
	docker build -t ghcr.io/aokumasan/github-actions-sample:latest .

.PHONY: push
push:
	docker push ghcr.io/aokumasan/github-actions-sample:latest

.PHONY: install-tools
install-tools:
	@mkdir -p $(GOBIN)
	@for tool in $(TOOLS); do \
		GOBIN=$(GOBIN) go install $$tool; \
	done

.PHONY: license-check
license-check:
	@$(GOBIN)/go-licenses check --ignore github.com/aokumasan ./...
