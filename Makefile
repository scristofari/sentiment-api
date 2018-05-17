.Phony: dev prod test

.DEFAULT_GOAL := help

help: ## List all the command helps.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

dev: ## Run the project in dev mode
	docker build -t sentiment_api:latest .
	docker run -it -v $(PWD):/src/app -w /src/app -p 5000:5000 sentiment_api:latest bash

prod: ## Run the project in prod mode
	docker build -t sentiment_api:latest .
	docker run -d -p 5000:5000 sentiment_api:latest

test: ## Run tests
	python -m unittest -v .