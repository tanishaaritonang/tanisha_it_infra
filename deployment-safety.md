# Task 5 – Deployment Safety

## Purpose
This document describes basic deployment safety considerations to ensure reliable and safe application deployment in a production-like environment.

---

## Pre-deployment Checklist
Before deploying an application, the following checks should be performed:

- Code has been reviewed and tested
- Docker image builds successfully without errors
- Configuration values (ports, environment variables) are validated
- No hardcoded secrets in source code
- Required ports are not already in use
- Previous running containers are identified
- Rollback plan is prepared

---

## Production Restrictions
In a production environment, several restrictions should be applied:

- No direct changes on production servers
- No testing or debugging directly in production
- Access limited to authorized users only
- Root access should be avoided where possible
- Deployment should be done using automation tools (CI/CD)
- Logs and monitoring should be enabled

---

## Deployment Strategy
A simple and safe deployment strategy includes:

- Deploying through a CI/CD pipeline
- Using versioned Docker images
- Running health checks after deployment
- Ensuring reverse proxy handles external traffic

---

## Rollback Strategy
If a deployment fails, a rollback should be performed quickly using versioned Docker images:

- Tag each release with a unique version (e.g., `intern-nginx:v1.0.0`)
- Maintain a registry of previous stable versions
- To rollback, redeploy with the previous stable image version
- Verify application health after rollback

Rollback example:
```bash
# Stop current deployment
docker compose down

# Pull the previous stable version
docker pull intern-nginx:v1.0.0

# Update docker-compose.yml to use the stable version
# Or use environment variable to specify the image tag

# Start the previous stable version
docker compose up -d

# Verify health
curl -f http://localhost:${HOST_PORT}
```

### Image Versioning Best Practices
- Use semantic versioning (e.g., v1.0.0, v1.1.0)
- Tag images with git commit hashes for traceability
- Maintain a changelog for each version
- Store images in a secure container registry

