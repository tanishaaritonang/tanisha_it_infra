# Task 4 – CI/CD Concept

## CI/CD Tool Used
GitHub Actions is used to implement the CI/CD pipeline.

---

## What is CI?
Continuous Integration (CI) is the practice of automatically building and testing code whenever changes are pushed to the repository.

---

## What is CD?
Continuous Delivery / Continuous Deployment (CD) focuses on delivering validated applications to an environment.

- Continuous Delivery: Deployment requires manual approval
- Continuous Deployment: Deployment is fully automated

---

## CI vs CD
| CI | CD |
|----|----|
| Build & test code | Deploy application |
| Triggered on code changes | Triggered after CI success |
| Ensures code quality | Ensures fast and reliable delivery |

---

## CI/CD Flow in This Project
1. Code is pushed to the main branch
2. GitHub Actions workflow is triggered
3. Docker image is built
4. Container is run for testing
5. Application health check is performed
6. Test container is cleaned up

---

## Why GitHub Actions
- Native integration with GitHub repository
- Easy to configure using YAML
- Suitable for small to medium CI/CD pipelines

---

## Notes
This pipeline demonstrates CI concepts.  
In production environments, additional steps such as image tagging, registry push, and environment-based deployment would be added.

