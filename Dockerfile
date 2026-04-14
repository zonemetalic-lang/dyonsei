FROM ollama/ollama:latest

# Install Node + OpenClaw
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g @openclaw/cli

# Pull model pas build biar cepet
RUN nohup bash -c "ollama serve &" && sleep 5 && ollama pull qwen2:0.5b

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
