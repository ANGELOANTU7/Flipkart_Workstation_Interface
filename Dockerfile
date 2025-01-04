# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install required packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /root/home

# Copy requirements.txt into the container
COPY flipkart_grid_backend/requirements.txt .

COPY flipkart_grid_frontend_react/ /root/home/flipkart_grid_frontend_react
COPY flipkart_grid_backend/ /root/home/flipkart_grid_backend

# Install the Python dependencies
RUN pip3 install -r requirements.txt

RUN apt update && apt install nodejs npm -y 

RUN apt install curl -y

# Install Node.js dependencies
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && \
    export NVM_DIR="/root/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \ 
    . "$NVM_DIR/nvm.sh" && \
    nvm install --lts && \
    nvm use --lts

# Set up Node.js for the frontend
RUN export NVM_DIR="/root/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \ 
    . "$NVM_DIR/nvm.sh" && \
    cd /root/home/flipkart_grid_frontend_react && \
    npm install



# Default command (optional)
CMD ["python3"]
