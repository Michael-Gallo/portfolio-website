PORT ?= 8080
IMAGE ?= portfolio_website

export BUNDLE_PATH ?= vendor/bundle

.PHONY: setup serve test docker-build docker-serve

setup:
	bundle install

serve:
	@echo "Serving at http://localhost:$(PORT) (Ctrl+C to stop)"
	bin/rails server -p $(PORT)

test:
	bin/rails test

docker-build:
	docker build -t $(IMAGE) .

docker-serve: docker-build
	@echo "Serving Docker image at http://localhost:$(PORT) (Ctrl+C to stop)"
	docker run --rm -p $(PORT):80 -e SECRET_KEY_BASE=dummy $(IMAGE)
