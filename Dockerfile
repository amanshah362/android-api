# Use a slim base image
FROM python:3.12-slim

# Install system dependencies for OpenCV
RUN apt-get update && apt-get install -y libgl1 && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all files to the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port
EXPOSE 5000

# Start the API
CMD ["python", "api_server.py"]
