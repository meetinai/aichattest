# Use an official Python base image
FROM python:3.11-slim

# Create a non-root user with a specific UID and GID (e.g., 1001 for user and group)
RUN groupadd -g 1001 appuser && \
    useradd -u 1001 -g appuser -m appuser

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
