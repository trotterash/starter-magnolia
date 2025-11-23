#!/bin/bash
set -e

# Check if Magnolia is already set up
if [ ! -f "/magnolia/package.json" ]; then
    echo "First run detected. Setting up Magnolia..."
    cd /magnolia
    
    # Run jumpstart non-interactively
    # Select: demo-webapps (2) -> magnolia-community-demo-webapp (1)
    printf "2\n1\n" | mgnl jumpstart
    
    echo "Setup complete!"
fi

# Start Magnolia
echo "Starting Magnolia..."
cd /magnolia
exec npm run mgnl -- start
