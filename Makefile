dev:
	docker build -t sentiment_api:latest .
	docker run -it -v $(PWD):/src/app -w /src/app -p 5000:5000 sentiment_api:latest bash

prod:
	docker build -t sentiment_api:latest .
	docker run -d -p 5000:5000 sentiment_api:latest

test:
	python -m unittest -v