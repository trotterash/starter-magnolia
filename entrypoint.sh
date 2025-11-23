#!/bin/bash
set -e

# If package.json doesn't exist, show setup instructions
if [ ! -f "/magnolia/package.json" ]; then
    echo "==================================================="
    echo "First time setup required!"
    echo "Run: mgnl jumpstart"
    echo "Select: 2 (demo-webapps) -> 1 (magnolia-community-demo-webapp)"
    echo "==================================================="
    
    # If running with arguments, execute them instead of trying to start
    if [ $# -gt 0 ]; then
        exec "$@"
    fi
    
    echo "Waiting for setup..."
    exit 0
fi

# Start Magnolia
echo "Starting Magnolia..."
cd /magnolia
exec npm run mgnl -- start
