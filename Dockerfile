# Base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy your static HTML file into the container
COPY index.html /app/index.html

# Expose port (default HTTP port)
EXPOSE 8000

# Command to run the Python HTTP server
CMD ["python", "-m", "http.server", "8000", "--bind", "0.0.0.0"]
