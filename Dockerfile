# Use the official Ubuntu image as the base
FROM ubuntu:20.04

# Set environment variables to prevent interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and required system packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    libgl1 \
    libglib2.0-0 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install opencv-python
RUN python3 -m pip install scipy
RUN python3 -m pip install pandas
RUN python3 -m pip install numpy
RUN python3 -m pip install tensorboardX
RUN python3 -m pip install torch==1.13.1
RUn python3 -m pip install jpeg4py
RUN python3 -m pip install pillow
RUN python3 -m pip install lmdb
RUN python3 -m pip install onnx
RUN python3 -m pip install onnxruntime
RUN python3 -m pip install torchvision
RUN python3 -m pip install timm

RUN apt update && apt install -y \
    libx11-xcb1 \
    libxcb1 \
    libxcb-xkb1 \
    libxcb-render0 \
    libxcb-shape0 \
    libxcb-shm0 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-xinerama0 \
    libxkbcommon-x11-0 \
    libxrender1 \
    libsm6 \
    libgl1-mesa-glx \
    && apt clean

COPY . /code
# COPY ./datasets /datasets

WORKDIR /code
CMD ["python3", "tracking/video_demo.py", "/code/VT_ep1500.onnx", "/code/whatsapp_ready_reverse.mp4"]
#CMD ["python3", "tracking/test.py", "HiT", "HiT_Base", "--dataset", "lasot", "--threads", "2", "--num_gpus", "2", "--debug", "0"]
#python tracking/analysis_results.py # need to modify tracker configs and names

# CMD ["python3", "/code/run.py"]