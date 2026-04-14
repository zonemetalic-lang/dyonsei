#!/bin/bash
ollama serve &
sleep 5
openclaw models set ollama/qwen2:0.5b
openclaw channels add --channel telegram --token $TELEGRAM_TOKEN
openclaw gateway run
