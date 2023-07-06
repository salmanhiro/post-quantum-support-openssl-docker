#!/bin/bash

# Generate your file (replace with your own logic)
echo "This is a generated test file" > /shared/generated_file.txt

# Keep the container running to retain the shared volume
tail -f /dev/null