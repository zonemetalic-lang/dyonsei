FROM ollama/ollama:latest

# Install Python + pip + OpenClaw
RUN apt-get update && apt-get install -y python3 python3-pip curl && \
    pip3 install openclaw --break-system-packages

# Pull model pas build
RUN nohup bash -c "ollama serve &" && sleep 5 && ollama pull qwen2:0.5b

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
