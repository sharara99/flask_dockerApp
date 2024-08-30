FROM python:3.9-slim

# Install necessary system packages
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libmysqlclient-dev \
    && apt-get clean

# Install Python packages
RUN pip install --no-cache-dir flask flask-mysql

# Copy application code
COPY . .

# Expose the necessary port
EXPOSE 8080

# Define the default command
CMD ["python", "app.py"]
