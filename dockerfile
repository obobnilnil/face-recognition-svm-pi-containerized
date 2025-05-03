FROM python:3.9-slim

# Set working directory inside container
WORKDIR /home/jaidog/camera_pi/MLproject

# Copy requirements first and install
COPY requirements.txt .

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libopenblas-dev \
    liblapack-dev \
    libx11-dev \
    libgtk-3-dev \
    libboost-python-dev \
    libboost-thread-dev \
    libboost-system-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy source code
COPY . .

# Run the app
# CMD ["python", "ml_project.py"]
ENV PYTHONUNBUFFERED=1
CMD ["python", "-u", "ml_project.py"]