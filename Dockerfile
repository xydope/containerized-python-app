FROM python:3.14.7-slim

WORKDIR /app

ENV APP_ENV=development \
    APP_PORT=3000

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./app/ .

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:3000/health')"

CMD ["python", "app.py"]