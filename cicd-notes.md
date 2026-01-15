# Task 4 – CI/CD Concept

## What is CI?
Continuous Integration (CI) is the practice of automatically building and testing code whenever changes are pushed to a repository.
The main goal of CI is to detect issues early and ensure code quality.

---

## What is CD?
Continuous Delivery / Continuous Deployment (CD) focuses on automatically delivering the validated application to an environment.

- Continuous Delivery: Code is ready to be deployed manually
- Continuous Deployment: Code is deployed automatically without manual approval

---

## CI vs CD
| CI | CD |
|----|----|
| Build & test | Deploy |
| Runs on every change | Runs after CI success |
| Prevents broken code | Ensures fast delivery |

---

## CI/CD Flow Used in This Task
1. Validate required files (Dockerfile)
2. Build Docker image
3. Run container for testing
4. Perform simple health check
5. Cleanup test environment

---

## Tools
- Docker
- Shell Script (CI simulation)
- curl for application testing

---

## Why CI/CD is Important
- Faster feedback loop
- Reduced human error
- Consistent deployments
- Improved software quality

---

## Notes
The provided CI/CD pipeline is a simple simulation to demonstrate understanding of CI/CD concepts.
In real-world scenarios, tools such as GitHub Actions, GitLab CI, or Jenkins are commonly used.

