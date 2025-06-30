# RISC-V Single-Cycle Processor
![Block Diagram](riscv-single-cycle/results/BlockDiagram.png)

## 📝 Project Overview
32-bit RISC-V processor implementing RV32I ISA, developed for IEEE Digital Electronics Design Workshop. Features:
- Single-cycle Harvard architecture
- 7-stage pipeline (fetch → writeback)
- FPGA verified on Cyclone® IV

## 📁 Repository Structure
```
riscv-single-cycle/
├── rtl/                   # Source files
│   ├── core/             # Main processor components
│   │   ├── alu.v         # Arithmetic Logic Unit
│   │   ├── ALUDecoder.v
│   │   ├── MainDecoder.v
│   │   ├── ProgramCounter.v           # Program Counter
│   │   └── NextPC.v            
│   ├── memory/           # Memory components
│   │   ├── InstructionMemory.v   # Instruction Memory
│   │   ├── RegisterFile.v 
│   │   └── DataMemory.v    # Data Memory
│   └── top/              # Top-level modules
│       ├── SingleCycleCPU.v  # Main CPU top-level
│       ├── SignExtend.v   # Sign Extension unit
│       └── Mux2.v         # 2-to-1 Multiplexer
├── testbenches/          # Verification
│   ├── SingleCycleCPU_tb.v
│   └── test_programs/    # Assembly tests
│       └── program.hex # Test program
├── docs/
│   └── RV-32I.pdf        # IEEE workshop report
├── results/             # Simulation outputs
│   ├── BlockDiagram.png          
│   ├── PC.png          #Program Counter Simulation        
│   ├── IntsMEM.png     #Instruction Memory Check      
│   ├── SimulationResults.png      # GTKWave/VCD screenshot
│   ├── Synthesis.png          #Synthesis Implementation
│   └── FPGAImplementation.png          #FPGA Implementation   
└── README.md             # Project documentation
```

## 🛠️ Installation & Simulation
```bash
# Clone repository
git clone https://github.com/a7med57/riscv-single-cycle.git
cd riscv-single-cycle

# Run testbench (Icarus Verilog example)
iverilog -o sim testbenches/SingleCycleCPU_tb.v rtl/core/*.v
vvp sim
```

## 📊 Results
| Metric          | Value       |
|-----------------|-------------|
| Max Frequency   | 50 MHz      |
| CPI             | 1           |
| FPGA Resources  | 1200 LUTs   |

![Fibonacci Simulation](riscv-single-cycle/results/SimulationResults.png)

