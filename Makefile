docker-build:
	docker build -t sentry-kubernetes .
.PHONY: docker-build

upload-image-kind: docker-build
	kind load docker-image sentry-kubernetes
.PHONY: upload-image-kind

test:
	go test -count=1 .
.PHONY: test

build:
	go build .
.PHONY: build
