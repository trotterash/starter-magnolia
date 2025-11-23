#!/bin/bash
set -e

# Check if Magnolia needs to be downloaded
if [ ! -d "/magnolia/apache-tomcat" ]; then
    echo "First run detected. Downloading Magnolia..."
    cd /magnolia
    
    # Install dependencies if needed
    if [ ! -d "node_modules" ]; then
        npm install
    fi
    
    # Download Magnolia using the CLI (non-interactive with config files already present)
    echo "Downloading Magnolia Travel Demo..."
    npm run mgnl -- download magnolia-community-demo-webapp
    
    echo "Setup complete!"
fi

# Start Magnolia
echo "Starting Magnolia..."
cd /magnolia
exec npm run mgnl -- start
