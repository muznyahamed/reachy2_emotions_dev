#!/bin/bash

# check .venv folder if not create it

if [ ! -d ".venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv .venv
fi

source .venv/bin/activate

pip install -e .

emotion-play --list

cp .env console/openai-realtime-console/.env

cd console/openai-realtime-console

npm install
