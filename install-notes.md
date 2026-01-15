# Task 1 – Environment Preparation

## Environment Information

- **Operating System:** Ubuntu Server 22.04 LTS
- **Architecture:** amd64
- **User Type:** Non-root user
- **Purpose:** IT Infrastructure Internship Technical Assignment

---

## Installed Components

- Docker Engine
- Docker Compose (Docker Compose Plugin)

---

## Installation Steps

### 1. System Update

The system was updated to ensure all packages were up to date before installation.

```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Install Required Dependencies

Required packages were installed to support secure repository access.

```bash
sudo apt install -y ca-certificates curl gnupg lsb-release
```

### 3. Add Docker GPG Key

Docker's official GPG key was added to verify package authenticity.

```bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

### 4. Add Docker Repository

The official Docker repository was added to the system.

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
```

### 5. Install Docker Engine and Docker Compose

Docker Engine and Docker Compose plugin were installed from the official repository.

```bash
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### 6. Enable Docker Service

Docker service was started and enabled to run automatically on boot.

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

### 7. Configure Docker Without Sudo

The current user was added to the `docker` group to allow running Docker commands without root privileges.

```bash
sudo usermod -aG docker $USER
```

After this step, the user logged out and logged back in to apply the new group permissions.

---

## Verification

To verify the installation was successful, the following commands can be used:

```bash
# Check Docker version
docker --version

# Check Docker Compose version
docker compose version

# Verify Docker is running
sudo systemctl status docker

# Test Docker installation
docker run hello-world
```
