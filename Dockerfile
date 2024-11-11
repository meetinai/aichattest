# Use an official Python base image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Install Open WebUI using pip
RUN pip install open-webui

# Expose the port where Open WebUI will be accessible
EXPOSE 8080

# Command to run Open WebUI server
CMD ["open-webui", "serve"]
