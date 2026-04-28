FROM python:3.11-slim

WORKDIR /app

COPY techbleat-global-bank-backend/user-service/requirements.txt .
RUN pip install --no-cache-dir -r techbleat-global-bank-backend/user-service/requirements.txt

COPY techbleat-global-bank-backend/user-service/app ./app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
