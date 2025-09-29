#!/bin/bash

# check if reachy2 docker is running, if not start it
if [ "$(docker ps -q -f name=reachy2)" ]; then
    echo "Reachy2 Docker is running"
else
    echo "Starting Reachy2 Docker..."
    docker start reachy2
fi

echo "Waiting for Reachy2 to boot up..."
sleep 20

# activate venv
source .venv/bin/activate

# start emotion server in background
emotion-play --server &
EMOTION_PID=$!

echo "Emotion server started (PID: $EMOTION_PID)."
sleep 5

# start npm dev server in background
cd console/openai-realtime-console
npm run dev &
NPM_PID=$!

echo "Simulation UI: http://localhost:6080/vnc.html?autoconnect=1&resize=remote"
echo "UI started    : http://localhost:3000"
echo "Press [CTRL+C] to stop.."

# keep script alive until both background processes exit
wait $EMOTION_PID $NPM_PID
