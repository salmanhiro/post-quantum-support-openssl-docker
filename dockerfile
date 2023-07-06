FROM alpine:latest

# Install any necessary dependencies
RUN apk add --no-cache bash

# Set the working directory
WORKDIR /app

# Copy your script or program that generates the file into the container
COPY generate_file.sh /app/generate_file.sh

# Make the script executable
RUN chmod +x /app/generate_file.sh

# Set the entry point to the script
ENTRYPOINT ["/app/generate_file.sh"]
