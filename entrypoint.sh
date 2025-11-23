#!/bin/bash
set -e

# Check if Magnolia has been set up (apache-tomcat directory exists)
if [ ! -d "/magnolia/apache-tomcat" ]; then
    echo "=============================================="
    echo "FIRST TIME SETUP REQUIRED"
    echo "=============================================="
    echo ""
    echo "Please run the following commands:"
    echo ""
    echo "  docker compose run --rm magnolia-cli mgnl jumpstart"
    echo ""
    echo "Then select:"
    echo "  - Option 2: demo-webapps"
    echo "  - Option 1: magnolia-community-demo-webapp"
    echo ""
    echo "After setup completes, start with:"
    echo "  docker compose up -d"
    echo ""
    echo "=============================================="
    exit 1
fi

# Start Magnolia
echo "Starting Magnolia..."
cd /magnolia
exec npm run mgnl -- start
