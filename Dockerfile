FROM ubuntu:22.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    m4 \
    scons \
    zlib1g \
    zlib1g-dev \
    libprotobuf-dev \
    protobuf-compiler \
    libprotoc-dev \
    libgoogle-perftools-dev \
    python3-dev \
    python3 \
    python3-six \
    python-is-python3 \
    libboost-all-dev \
    pkg-config \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /gem5

# Clone gem5 (you can also mount a local copy)
RUN git clone https://gem5.googlesource.com/public/gem5 .

# Build gem5 for X86
RUN scons build/X86/gem5.opt -j$(nproc)

WORKDIR /workspace
