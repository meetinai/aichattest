# Copyright notice and license can be added here if needed

# Use Python 3.11 as the base image for building
FROM python:3.11-slim AS build

# Set working directory
WORKDIR /app

# Create a virtual environment and activate it
RUN python -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

# Install open-webui
RUN pip install --no-cache-dir open-webui

# Create a non-privileged user for running the application
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid 10014 \
    "choreo"

# Set environment variables
ENV ENABLE_PERMISSIONS=TRUE
ENV DEBUG_PERMISSIONS=TRUE
ENV USER_APP=10014
ENV GROUP_APP=10014

# Switch to non-root user
USER 10014

# Expose the default port (adjust if needed)
EXPOSE 8080

# Command to run the application
CMD ["open-webui", "serve"]
