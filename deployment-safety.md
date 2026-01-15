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
If a deployment fails, a rollback should be performed quickly:

- Stop the faulty container
- Redeploy the previous stable Docker image
- Restart services using Docker Compose
- Verify application health after rollback

Rollback example:
```bash
docker compose down
docker compose up -d

