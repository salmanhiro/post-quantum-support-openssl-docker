#!/bin/bash

# Generate your file (replace with your own logic)
echo "Installation succesfull" > /shared/generated_file.txt

# Keep the container running to retain the shared volume
tail -f /dev/null