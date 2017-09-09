from flask import Flask, request
from textblob import TextBlob
from werkzeug.exceptions import BadRequest
import json

app = Flask(__name__)


@app.route('/', methods=['POST'])
def submitted_text():
    text = request.form['text']
    if not text:
        raise BadRequest(description="failed to get the text.")

    polarity, subjectivity = _sentiment(text)
    return json.dumps({
        'polarity': polarity,
        'subjectivity': subjectivity
    })


def _sentiment(text=""):
    blob = TextBlob(text)
    polarity = subjectivity = 0
    size = len(blob.sentences)
    for sentence in blob.sentences:
        polarity += sentence.sentiment.polarity
        subjectivity += sentence.sentiment.subjectivity

    return polarity / size, subjectivity / size


if __name__ == '__main__':
    app.run(debug=False, host='0.0.0.0')
