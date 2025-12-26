#!/bin/bash
# Startup script for Ceramica KhUTM Web App

cd "$(dirname "$0")"

echo "=============================================="
echo "  Ceramica KhUTM - Classification Web App"
echo "=============================================="

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
source venv/bin/activate

# Install dependencies
echo "Installing dependencies..."
pip install -q -r requirements.txt

# Check if ML API is running
echo "Checking ML API..."
if curl -s http://localhost:8080/api/v1/stats > /dev/null 2>&1; then
    echo "✓ ML API is running at http://localhost:8080"
else
    echo "⚠ Warning: ML API not detected at http://localhost:8080"
    echo "  Make sure to start the pottery-comparison viewer_app.py first"
fi

# Start the web app
echo ""
echo "Starting web application..."
echo "Open: http://localhost:5001"
echo ""
python app.py
