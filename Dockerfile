# Use Ollama base image
FROM ollama/ollama

# Pull the model you want to run
RUN ollama pull smollm:135m

# Expose Ollama API on port 11434
EXPOSE 11434

# Start the Ollama service
CMD ["ollama", "serve"]
