# Base Ollama image
FROM ollama/ollama

# Expose the default Ollama port
EXPOSE 11434

# Start the server and preload the model at runtime
CMD /bin/sh -c "ollama serve & sleep 5 && ollama pull smollm:135m && tail -f /dev/null"
