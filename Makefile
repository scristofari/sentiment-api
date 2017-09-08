start:
	docker build -t sentiment_api:latest .
	docker run -it -v $(PWD):/src/app -w /src/app -p 5000:5000 flash_sentiment:latest bash
