# Start from the official Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to root to install packages
USER root

# Install Docker CLI and dependencies
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bullseye stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Allow Jenkins user to use Docker (required for pipelines)
RUN groupadd -f docker && usermod -aG docker jenkins

# Optional: persistent Docker volume (if running Docker from inside Jenkins)
VOLUME /var/lib/docker

# Switch back to Jenkins user
USER jenkins
