FROM python:3.14.7-slim
WORKDIR /app
COPY requirements.txt .
COPY ./app/ .
RUN pip install -r requirements.txt
EXPOSE 3000
CMD ["python", "app.py"]