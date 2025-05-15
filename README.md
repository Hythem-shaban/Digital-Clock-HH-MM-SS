# 🕒 Digital Clock (HH:MM:SS) – Verilog RTL Design

A digital clock implemented in **Verilog**, displaying time in **HH:MM:SS** format. The project is designed for simulation using **QuestaSim** and synthesis on the **Intel DE10-Lite FPGA** using **Intel Quartus Prime Lite**.

## Features

- Modular RTL design with separate modules for seconds, minutes, and hours.
- Automated simulation setup with `run.do` in QuestaSim
- Synthesis-ready for DE10-Lite FPGA to display the clock on seven-segment display.

---

## Project Structure

```plaintext
Digital-Clock-HH-MM-SS/
│
├── rtl/                    # Verilog RTL design files
│   ├── count_12.v          # Hours counter module
│   ├── count_59.v          # Minutes/Seconds counter module
│   ├── clock.v             # Top module for the clock
│   ├── even_clk_div.v      # Clock Divider to reduce the clock frequency from 50MHz to 1Hz
│   ├── decoder_7seq.v      # Seven segment decoder to display the clock on 7-segment display
│   └── top.v               # Top module connecting all units
│
├── tb/                     # Testbench and simulation files
│   ├── clock_tb.v          # Testbench for the clock module
│   ├── transcript          # The transcript of the simulation
│   ├── wave.vcd            # A DUMP file for the waveform
│   └── run.do              # QuestaSim DO file for automated simulation
│
├── syn/                    # Quartus project files (optional or WIP)
│
├── README.md               # Project documentation
│
└── LICENSE                 # License info (MIT)
```
---

## RTL Design

---

## Simulation
### Setup
This project includes a testbench and a ready-made `run.do` script to simplify simulation using **Questa Simulator** (QuestaSim).
#### How to Simulate
1. **Navigate to the `tb/` directory**:
   ```bash
   cd tb
   ```
2. **Run the simulation script**:
  ```bash
  vsim -do run.do
  ```
    - The run.do script handles:
      1. Compiling all design and testbench files
      2. Loading the top-level testbench
      3. Launching the simulation with waveform display

### Waveform Snipits
![Alt Text](/images/one_min.png)
![Alt Text](/images/one_hour.png)
![Alt Text](/images/one_day.png)

### Transcript Snipit
![Alt Text](/images/Transcript.png)

---

## FPGA Implementation


