# Base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy your application code into the container
COPY . .

# Install dependencies (optional: add requirements.txt if available)
# RUN pip install -r requirements.txt

# Expose port
EXPOSE 8000

# Command to run your app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

