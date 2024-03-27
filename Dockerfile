FROM python:3.9-slim
WORKDIR /app
COPY app/requirements.txt ./
COPY app/api.py ./
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "api.py"]
