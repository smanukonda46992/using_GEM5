# GEM5 Simulator: Hello World Program Execution

**Course:** Computer Architecture Design  
**Student:** Sai Mohan Manukonda  
**Student ID:** 005046992  
**Instructor:** Professor Gary Perry  
**Institution:** University of the Cumberlands  

---

## 📋 Project Overview

This repository contains the implementation and documentation for running a "Hello World" C program using the GEM5 computer architecture simulator. The project demonstrates the fundamentals of processor simulation, including installation, configuration, and execution analysis.

## 🎯 Objectives

- Install and configure GEM5 simulator on a Linux environment
- Write and cross-compile a simple C program for X86 architecture
- Execute the program using GEM5's Syscall Emulation (SE) mode
- Analyze simulation output and performance metrics

## 📁 Repository Structure

```
Using_GEM5/
├── hello.c                      # Source code - Hello World program
├── run_hello.py                 # GEM5 simulation configuration script
├── GEM5_Assignment_Report.md    # Comprehensive assignment report (Markdown)
├── GEM5_Assignment_Report.pdf   # Final report for submission
├── GEM5_Assignment_Report.html  # HTML version of report
├── Dockerfile                   # Docker configuration for Linux environment
├── run_assignment.sh            # Automation script for running simulation
├── screenshots/                 # Documentation screenshots
│   ├── 01_install_dependencies.png
│   ├── 02_git_clone.png
│   ├── 03_gem5_build_complete.png
│   ├── 04_hello_c_code.png
│   ├── 05_compile_hello.png
│   ├── 06_simulation_output.png
│   └── 07_stats_output.png
├── gem5/                        # GEM5 simulator (cloned from Google Source)
└── m5out/                       # Simulation output directory
    └── stats.txt                # Detailed simulation statistics
```

## 🛠️ Environment Setup

### Prerequisites

- **Host System:** macOS with Apple Silicon (ARM64) or Linux
- **Docker:** Required for running Linux environment on macOS
- **RAM:** Minimum 8GB (16GB recommended)
- **Disk Space:** At least 10GB free

### Quick Start with Docker

```bash
# Start Ubuntu container with workspace mounted
docker run -it -v $(pwd):/workspace ubuntu:22.04 /bin/bash

# Inside container - Install dependencies
apt-get update
apt-get install -y python3 scons gcc g++ git build-essential m4 \
    zlib1g zlib1g-dev libprotobuf-dev protobuf-compiler \
    libprotoc-dev libgoogle-perftools-dev python3-dev \
    python3-six python-is-python3 libboost-all-dev pkg-config \
    gcc-x86-64-linux-gnu
```

## 🚀 Running the Simulation

### Step 1: Clone and Build GEM5

```bash
git clone https://gem5.googlesource.com/public/gem5
cd gem5
scons build/X86/gem5.opt -j$(nproc)
```

### Step 2: Compile Hello World Program

```bash
# Cross-compile for X86 (required on ARM hosts)
x86_64-linux-gnu-gcc -static hello.c -o hello

# Verify binary architecture
file hello
# Expected: ELF 64-bit LSB executable, x86-64...
```

### Step 3: Run Simulation

```bash
./gem5/build/X86/gem5.opt ./gem5/configs/deprecated/example/se.py -c ./hello
```

## 📊 Simulation Results

| Metric | Value |
|--------|-------|
| **Exit Tick** | 11,491,500 |
| **Simulated Time** | ~11.5 µs |
| **Instructions** | 10,220 |
| **CPU Cycles** | 23,016 |
| **CPI** | 2.25 |
| **IPC** | 0.44 |

### Sample Output

```
gem5 Simulator System.  https://www.gem5.org
gem5 version 23.0.0.1
...
**** REAL SIMULATION ****
Hello, World!
Exiting @ tick 11491500 because exiting with last active thread context
```

## 🔧 Troubleshooting

| Issue | Solution |
|-------|----------|
| macOS compatibility | Use Docker with Ubuntu 22.04 |
| ARM vs X86 mismatch | Use x86_64-linux-gnu-gcc cross-compiler |
| Deprecated script path | Use `configs/deprecated/example/se.py` |
| Missing dependencies | Install full dependency list (see above) |
| Long build time | Use `-j$(nproc)` for parallel compilation |

## 📚 References

- [GEM5 Official Documentation](https://www.gem5.org/documentation/)
- [GEM5 Getting Started Guide](https://www.gem5.org/getting_started/)
- [Docker Documentation](https://docs.docker.com/)

## 📄 License

This project is for educational purposes as part of the Computer Architecture Design course at University of the Cumberlands.

---

*Last Updated: March 12, 2026*
