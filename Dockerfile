# Use a full Ubuntu base
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y curl unzip git

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | bash

# Expose default Ollama port
EXPOSE 11434

# Start Ollama server and pull the model
CMD bash -c "ollama serve --host 0.0.0.0 & sleep 5 && ollama pull smollm:135m && tail -f /dev/null"
