# kotaemon-setup
docker run \
-e GRADIO_SERVER_NAME=0.0.0.0 \
-e GRADIO_SERVER_PORT=7860 \
-v ./ktem_app_data:/app/ktem_app_data \
-p 7860:7860 -it --rm \
--platform linux/arm64 \
ghcr.io/cinnamon/kotaemon:main-full

# Within Docker to make markdown work
pip install pylance
# Connect to Ollama
host.internal.docker

# Embeddings
api_key: ollama
base_url: http://host.docker.internal:11434/v1/
model: embeddinggemma:latest

# LLMs
api_key: ollama
base_url: http://host.docker.internal:11434/v1/
model: gpt-oss:20b
