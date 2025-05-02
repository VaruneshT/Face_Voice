# Use an official Python runtime as a base image
FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libglib2.0-0 \
    ffmpeg \
    libsndfile1 \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Set environment variables (optional, if you have secrets/configs)
# ENV DATABASE_URL=your_database_url

# Expose the port your app runs on (if needed)
EXPOSE 5000

# Start command
CMD ["python", "app.py"]
