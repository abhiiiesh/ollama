FROM ubuntu:22.04

# Force IPv4 for networking
RUN echo 'Acquire::ForceIPv4 "true";' > /etc/apt/apt.conf.d/99force-ipv4

# Install dependencies
RUN apt-get update && apt-get install -y curl unzip git

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | bash

# Expose Ollama port
EXPOSE 11434

# Startup command
CMD bash -c "ollama serve --host 0.0.0.0 & sleep 5 && ollama pull smollm:135m && tail -f /dev/null"
