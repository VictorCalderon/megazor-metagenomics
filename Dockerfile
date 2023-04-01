# Let's use ubuntu's LTS image
FROM metagenomics-env-v1:latest

# Create a working directory
WORKDIR /app

# Copy mg-analyzer pipeline analysis script
COPY mg-analyzer /bin

# Simple echo to test
RUN echo "Image built successfully"

# Set entry point to this image
CMD ["bash"]