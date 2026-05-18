FROM python:3.11-slim

# Set working directory inside the container
WORKDIR /app

# Install system dependencies required for PostgreSQL (psycopg2)
RUN apt-get update && apt-get install -y libpq-dev gcc

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 8000 for the FastAPI application
EXPOSE 8000

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
