#!/bin/bash
set -e

# Check if Magnolia is already set up
if [ ! -f "/magnolia/package.json" ]; then
    echo "First run detected. Setting up Magnolia..."
    cd /magnolia
    
    # Run jumpstart non-interactively using a temporary input file
    # Select: demo-webapps (2) -> magnolia-community-demo-webapp (1)
    echo "2" > /tmp/mgnl-input
    echo "1" >> /tmp/mgnl-input
    mgnl jumpstart < /tmp/mgnl-input
    rm -f /tmp/mgnl-input
    
    echo "Setup complete!"
fi

# Start Magnolia
echo "Starting Magnolia..."
cd /magnolia
exec npm run mgnl -- start
