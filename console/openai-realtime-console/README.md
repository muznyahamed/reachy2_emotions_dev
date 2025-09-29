# reachy2_emotions


## 🛠 Installation

Docker
```bash
docker run -d --platform linux/amd64 \
  -p 8888:8888 -p 6080:6080 -p 50051:50051 -p 50065:50065 \
  --name reachy2 docker.io/pollenrobotics/reachy2
```

## Setup

```bash
  chmod +x ./setup.sh
  ./setup.sh
```

## Run


```bash
  chmod +x ./start.sh
  ./start.sh
```


## Old instruction
Python package

```bash
python -m venv .venv
```

Activate the virtual environment:

```bash
source .venv/bin/activate
```

```bash
pip install -e .
```

### emotion-play

```bash
emotion-play --name amazed1
```

List available emotions and play around!

```bash
emotion-play --list
```

