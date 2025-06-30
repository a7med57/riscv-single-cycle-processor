# RISC-V Single-Cycle Processor
![Block Diagram](docs/block_diagram.png)

## 📝 Project Overview
32-bit RISC-V processor implementing RV32I ISA, developed for IEEE Digital Electronics Design Workshop. Features:
- Single-cycle Harvard architecture
- 7-stage pipeline (fetch → writeback)
- FPGA verified on Cyclone® IV

## 📁 Repository Structure
```
# (Paste your folder structure here)
```

## 🛠️ Installation & Simulation
```bash
# Clone repository
git clone https://github.com/your-username/riscv-single-cycle.git
cd riscv-single-cycle

# Run testbench (Icarus Verilog example)
iverilog -o sim testbenches/processor_tb.v rtl/core/*.v
vvp sim
```

## 📊 Results
| Metric          | Value       |
|-----------------|-------------|
| Max Frequency   | 50 MHz      |
| CPI             | 1           |
| FPGA Resources  | 1200 LUTs   |

![Fibonacci Simulation](results/waveform.png)

## 📚 Resources
- [RISC-V Spec](https://riscv.org/technical/specifications/)
- [Workshop Slides](docs/ieee_workshop.pdf)
