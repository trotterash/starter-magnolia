#!/bin/bash
set -e

# If arguments are provided, execute them (allows running CLI commands)
if [ $# -gt 0 ]; then
    exec "$@"
fi

# Check if Magnolia has been set up (apache-tomcat directory exists)
if [ ! -d "/magnolia/apache-tomcat" ]; then
    echo "=============================================="
    echo "FIRST TIME SETUP REQUIRED"
    echo "=============================================="
    echo ""
    echo "Please download Magnolia first:"
    echo ""
    echo "  ./download-magnolia.sh"
    echo ""
    echo "Then start with:"
    echo "  docker compose up -d"
    echo ""
    echo "=============================================="
    exit 1
fi

# Start Magnolia
echo "Starting Magnolia..."
cd /magnolia
exec npm run mgnl -- start
