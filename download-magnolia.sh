#!/bin/bash
set -e

echo "=========================================="
echo "Magnolia CMS Download Script"
echo "=========================================="
echo ""

# Check if already downloaded
if [ -d "apache-tomcat" ]; then
    echo "✓ Magnolia already downloaded (apache-tomcat exists)"
    echo ""
    echo "To re-download, first run:"
    echo "  sudo rm -rf apache-tomcat node_modules"
    echo ""
    exit 0
fi

echo "This script will download Magnolia 6.4.0 with Travel Demo"
echo "Download size: ~190MB, Extracted size: ~570MB"
echo ""
read -p "Continue? (y/n) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Download cancelled"
    exit 0
fi

echo ""
echo "Downloading Magnolia 6.4.0 Community Demo..."
echo ""

# Download from official Magnolia source
DOWNLOAD_URL="https://nexus.magnolia-cms.com/repository/maven-public/info/magnolia/bundle/magnolia-community-demo-webapp/6.4.0/magnolia-community-demo-webapp-6.4.0-tomcat-bundle.zip"

if command -v wget &> /dev/null; then
    wget --show-progress "${DOWNLOAD_URL}" -O magnolia.zip
elif command -v curl &> /dev/null; then
    curl -L "${DOWNLOAD_URL}" -o magnolia.zip --progress-bar
else
    echo "ERROR: Neither wget nor curl found. Please install one of them."
    exit 1
fi

echo ""
echo "Extracting..."
unzip -q magnolia.zip

echo "Organizing files..."
mv magnolia-community-demo-webapp-6.4.0 apache-tomcat
rm magnolia.zip

echo ""
echo "=========================================="
echo "✓ Download complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "  1. Start Magnolia: docker compose up -d"
echo "  2. Wait 2-3 minutes for initialization"
echo "  3. Access: http://localhost:8080/magnoliaAuthor"
echo ""
