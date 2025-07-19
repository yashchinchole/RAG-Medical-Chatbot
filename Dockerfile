# 1. Use slim Python base image
FROM python:3.11-slim

# 2. Set environment variables for cleaner Python logs
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# 3. Set working directory
WORKDIR /app

# 4. Install uv globally
RUN pip install --no-cache-dir uv

# 5. Copy project metadata files first to leverage caching
COPY pyproject.toml uv.lock ./

# 6. Create venv and install dependencies via uv
RUN uv venv && \
    .venv/bin/python -m pip install --upgrade pip && \
    .venv/bin/pip install -e .

# 7. Copy source code
COPY . .

# 8. Expose only flask port
EXPOSE 5000

# 9. Run the Flask app
CMD ["python", "app/application.py"]
