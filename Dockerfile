# Dockerfile
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# ติดตั้ง dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# คัดลอกโค้ด
COPY app ./app

# Expose port
EXPOSE 8000

# รันแอป
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]