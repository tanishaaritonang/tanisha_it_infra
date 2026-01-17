# IT Infrastructure Internship Assignment

## Overview
This project demonstrates a containerized application deployment using Docker, Docker Compose, and Nginx as a reverse proxy. The setup follows production-ready practices including environment configuration, health checks, and deployment safety measures.

## Architecture
- **App Service**: Serves static content using Nginx
- **Proxy Service**: Nginx reverse proxy that forwards requests to the app service
- **Network**: Custom bridge network for container isolation
- **Configuration**: Environment variables for flexible configuration

## Features Implemented

### 1. Container Configuration
- Dockerfile creates an optimized Nginx image
- App service does not expose ports directly to host (only accessible via proxy)
- Proxy service handles all external traffic

### 2. Environment Variables
- All configurations use environment variables from `.env` file
- Port mappings are configurable via `HOST_PORT` and `NGINX_PORT`
- App internal port is configurable via `APP_PORT`

### 3. Health Checks
- App service includes health check to ensure service readiness
- Prevents 502 Bad Gateway errors by verifying service availability

### 4. Restart Policies
- Both services have `restart: always` policy for resilience

### 5. Network Isolation
- Custom bridge network isolates container communication
- Secure internal DNS resolution between services

### 6. CI/CD Pipeline
- Automated build, test, and validation process
- Health check verification
- Cleanup of test environment

### 7. Deployment Safety
- Pre-deployment checklist
- Versioned Docker images for rollback capability
- Proper rollback procedures documented

## Files Structure
```
├── Dockerfile              # Builds the app service image
├── docker-compose.yml      # Defines services, networks, and volumes
├── .env                    # Environment variables configuration
├── proxy.conf              # Nginx reverse proxy configuration template
├── nginx.conf.template     # Nginx app service configuration template
├── deployment-safety.md    # Deployment safety guidelines
├── cicd-notes.md           # CI/CD concept documentation
├── install-notes.md        # Environment preparation guide
└── fix.md                  # Revision requirements
```

## Usage

### Start Services
```bash
docker compose up -d
```

### Access Application
The application will be available at `http://localhost:8080` (configurable via `.env`)


## Environment Variables
- `HOST_PORT`: External port exposed to host (default: 8080)
- `NGINX_PORT`: Internal port for nginx services (default: 80)
- `APP_PORT`: Internal port for app service (default: 80)



## Security & Best Practices
- App service is not directly accessible from host
- All traffic flows through the proxy layer
- No hardcoded configurations
- Health checks ensure service availability
- Proper restart policies for service resilience
- Environment-based configuration management