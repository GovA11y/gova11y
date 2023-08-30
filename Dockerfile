# Dockerfile
# Build the API component
FROM app/api:latest AS api

# Build the frontend component
FROM app/frontend:latest AS frontend

# Combine the built images into a single image
FROM python:3.9-bullseye

# Set the working directory to /app
WORKDIR /app

# Copy the API components
COPY --from=api /app /app/api

# Copy the frontend components
COPY --from=frontend /app /app/frontend

# Install additional dependencies



# Set env vars
ENV PORT_API=7070
ENV PORT_FRONT=7071

# Expose the ports
EXPOSE $PORT_API
EXPOSE $PORT_FRONT

# Run start commans
CMD ["python", "start.py"]

# Other things?
