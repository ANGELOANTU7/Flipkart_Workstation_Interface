# Smart Inventory Management System

A sophisticated inventory management system built with FastAPI, React, and Computer Vision capabilities. The system performs real-time product detection, expiry date tracking, and quality assessment for both packaged products and fresh produce.

## 🌟 Features

### Packaged Products Management
- Real-time product detection using YOLO object detection
- Automatic expiry date extraction and tracking
- Batch number identification
- Comprehensive reporting system with Excel export
- Cloud storage integration with AWS S3

### Fresh Produce Management
- Quality assessment for fruits and vegetables
- Real-time counting and classification
- Expected life span prediction
- Detailed quality reports generation

### Technical Features
- WebSocket integration for real-time video processing
- Multi-model inference pipeline
- Docker containerization
- Automatic data persistence
- Cross-origin resource sharing (CORS) support
- File monitoring system

## 🛠️ System Requirements

- Python 3.8+
- CUDA-capable GPU (recommended)
- Docker
- Node.js (for frontend)
- AWS credentials (for S3 integration)

## 📦 Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd <repository-name>
```

2. Set up environment variables:
```bash
# Create .env file
touch .env

# Add the following variables
DEVICE_ID=<your-device-id>
AWS_ACCESS_KEY_ID=<your-aws-access-key>
AWS_SECRET_ACCESS_KEY=<your-aws-secret-key>
AWS_REGION=<your-aws-region>
```

3. Build and run using Docker:
```bash
# Build the Docker image
docker build -t worker_software:latest .

# Run the container
./devel.sh
```

4. Enter the container:
```bash
./enter_bash.sh
```

## 🎯 Model Setup

The system requires three YOLO models:
- `model/object_detection.pt` - For packaged product detection
- `model/expiry.pt` - For expiry date detection
- `model/fruit.pt` - For fruit and vegetable quality assessment

Place these models in the appropriate directories before running the system.

## 🔧 Configuration

### CycloneDDS Configuration
The system uses CycloneDDS for communication. Configure network settings in `ddsconfig.xml`:

```xml
<CycloneDDS xmlns="https://cdds.io/config">
    <Domain id="any">
        <!-- Configure network interface if needed -->
        <!-- <General>
            <NetworkInterfaceAddress>your-interface</NetworkInterfaceAddress>
        </General> -->
    </Domain>
</CycloneDDS>
```



## 🚀 API Endpoints

### WebSocket Endpoints
- `/ws/camera_feed_expiry` - Real-time camera feed for expiry detection
- `/ws/packed_products_expiry` - Real-time updates for packed products
- `/ws/camera_feed_fruit` - Real-time camera feed for fruit detection
- `/ws/fruits` - Real-time updates for fruit detection

### REST Endpoints
- `POST /upload-data-video` - Upload training data videos
- `GET /reset-detection` - Reset detection state
- `GET /set-in-sensor` - Set sensor state
- `POST /finish-task` - Generate reports and upload to S3
- `GET /download-report` - Download generated reports

## 📊 Data Management

The system maintains several data structures:
- Product expiry details in JSON format
- Fruit and vegetable quality assessments
- Real-time detection buffers
- AWS S3 storage for reports and logs
