FROM node:22

# Install Java (required by Magnolia)
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Install Magnolia CLI
RUN npm install -g @magnolia/cli

# Set working directory
WORKDIR /magnolia

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Start Magnolia automatically
ENTRYPOINT ["/entrypoint.sh"]
