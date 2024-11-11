# Stage 1: Build stage
FROM python:3.11-slim as build-env

# Set up application directory and install dependencies
WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Create a new user with UID between 10000 and 20000
RUN groupadd -g 10001 appuser && \
    useradd -u 10001 -g appuser -m appuser

# Copy the source code into the container
COPY . .

# Stage 2: Final runtime stage
FROM python:3.11-slim

# Set up working directory
WORKDIR /app

# Copy the installed dependencies from the build stage
COPY --from=build-env /app /app

# Expose port 8080
EXPOSE 8080

# Use a non-root user with UID between 10000 and 20000
USER appuser:appuser

# Command to start Open WebUI server
CMD ["open-webui", "serve"]
