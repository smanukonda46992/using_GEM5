#!/bin/bash

# GEM5 Hello World Assignment - Complete Script
# Run this script inside a Linux environment (Docker/VM/Cloud)

echo "=========================================="
echo "GEM5 Hello World Assignment Setup"
echo "=========================================="

# Step 1: Update system
echo "[Step 1] Updating system..."
sudo apt-get update

# Step 2: Install dependencies
echo "[Step 2] Installing dependencies..."
sudo apt-get install -y python3 scons gcc g++ git build-essential m4 zlib1g zlib1g-dev libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev python3-dev libboost-all-dev pkg-config python-is-python3

# Step 3: Clone gem5 (skip if already exists)
echo "[Step 3] Cloning GEM5..."
if [ ! -d "gem5" ]; then
    git clone https://gem5.googlesource.com/public/gem5
else
    echo "gem5 directory already exists, skipping clone"
fi

# Step 4: Build gem5
echo "[Step 4] Building GEM5 (this takes 30-60 minutes)..."
cd gem5
scons build/X86/gem5.opt -j$(nproc)
cd ..

# Step 5: Create hello.c
echo "[Step 5] Creating hello.c..."
cat > hello.c << 'EOF'
#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    return 0;
}
EOF

# Step 6: Compile hello.c with static linking
echo "[Step 6] Compiling hello.c..."
gcc -static hello.c -o hello

# Step 7: Run the simulation
echo "[Step 7] Running GEM5 simulation..."
./gem5/build/X86/gem5.opt ./gem5/configs/example/se.py -c ./hello

# Step 8: Show statistics
echo "[Step 8] Displaying statistics..."
echo "=========================================="
echo "Statistics Summary (first 50 lines):"
echo "=========================================="
head -50 m5out/stats.txt

echo ""
echo "=========================================="
echo "Assignment Complete!"
echo "=========================================="
