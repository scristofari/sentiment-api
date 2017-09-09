FROM python:3-alpine

RUN apk --no-cache update && apk add bash make

COPY . /src/app
WORKDIR /src/app

RUN pip install -r requirements.txt

RUN adduser -D sentiment
USER sentiment
RUN python -m textblob.download_corpora

CMD python main.py

EXPOSE 5000