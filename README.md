# reachy2_emotions

<div align="center">
  <img src="docs/gifs/accueillant1-pink-small.gif" width="220"/>
  <img src="docs/gifs/gene1-deepblue-small.gif" width="220"/>
  <img src="docs/gifs/perdu1-yellow-small.gif" width="220"/>
</div>

Record, replay, and experiment with expressive emotions on Reachy2!
This package provides CLI tools and utilities to capture synchronized motion and audio, replay them with smooth transitions, and serve emotion playback over a web API.

![CI](https://github.com/pollen-robotics/reachy2_emotions/actions/workflows/lint.yml/badge.svg)


---


## 🛠 Installation

Clone this repository. If you're using Reachy2 Docker stack, we recommend installing this outside the container to avoid host<->container sound issues.

For regular users:

```bash
pip install -e .[tools]
```

For development:
```bash
pip install -e .[dev,tools]
```

Package install:
```bash
sudo apt-get install libportaudio2
```


This enables live editing, linting, testing, and access to all CLI tools.


## 🖥 Record and replay Tools

After installation, two commands are available:


### emotion-play

Replays recorded joint trajectories and synchronized audio, with smooth interpolation and idle animations at the end.

```bash
emotion-play --name amazed1
```

List available emotions and play around!

```bash
emotion-play --list
```

Arguments of emotion-play:

    --ip: IP of Reachy (default: localhost)

    --name: name of the recording (without extension)

    --audio-device: optional audio output device

    --audio-offset: offset between motion and audio

    --record-folder: folder to load recordings from

    --server: launch a Flask server to accept emotion replay commands

    --flask-port: port for the server (default: 5001)

    --list: list available emotions

    --all-emotions: play all available recordings sequentially

### emotion-record

Records Reachy’s joint motions and microphone audio into .json and .wav files.
```bash
emotion-record --name devastated2
```

Arguments emotion-record:

    --ip: IP of Reachy (default: localhost)

    --name: base name for output files

    --freq: recording frequency (default: 100Hz)

    --audio-device: name or ID of the audio input device

    --list-audio-devices: list available audio input devices

    --record-folder: optional override for output folder

## Full Demo
To run the full demo where an LLM listens and Reachy reacts, follow the instructions here:
https://github.com/pollen-robotics/openai-realtime-console

## 🎛 Utility Tools
### plot_recording.py
Plot utility to inspect recordings. Can plot all the joints, only a part (e.g "r_arm"), or only a joint (e.g. "r_arm:1")
```bash
python3 plot_recording.py ../data/recordings/furious1.json --part r_arm
```
![image](docs/plot_example1.jpeg)

### rank.py

Ranks all .wav files in a folder by duration.
```bash
python tools/rank.py
```

### verif.py

Checks that each .json file has a matching .wav, and vice versa.
```bash
python tools/verif.py
```

### trim_all.py

Trims the first N seconds from all .wav files (default: 1.6s).
Used to align audio playback with motion onset after a BIP cue.
```bash
python tools/trim_all.py
```

⚠️ This modifies files in-place.

## 🧪 Testing & Development

To auto-format code:
```bash
black . --line-length 128
isort .
```

## 📁 Folder Structure
```
reachy2_emotions/
├── data/                # Emotion recordings (.json + .wav)
├── reachy2_emotions/    # Core source code (record + replay logic)
├── tools/               # Utility scripts (verif, trim, rank, etc.)
├── tests/
├── docs/
├── README.md
├── pyproject.toml
└── LICENSE
```
## 🧬 Acknowledgements

Record/replay scripts inspired by [Claire’s work on demo_events](https://github.com/pollen-robotics/demo_events/tree/main).

Developed by Pollen Robotics to explore expressive, communicative robots using Reachy2.

## 📢 Contributions

Contributions, ideas, and feedback are welcome!
Feel free to open issues or submit pull requests.

## 🧾 License

This project is licensed under the terms of the Apache 2.0 licence.
