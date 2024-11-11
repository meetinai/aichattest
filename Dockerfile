# Use an official Python base image
FROM python:3.11-slim

# Create a non-root user with a UID between 10000 and 20000
RUN groupadd -g 10001 appuser && \
    useradd -u 10001 -g appuser -m appuser

# Set the working directory inside the container
WORKDIR /app

# Install Open WebUI using pip
RUN pip install open-webui

# Expose the port where Open WebUI will be accessible
EXPOSE 8080

# Switch to the non-root user
USER appuser

# Command to run Open WebUI server
CMD ["open-webui", "serve"]
