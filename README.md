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
├── syn/                    # Quartus project files
│
├── README.md               # Project documentation
│
└── LICENSE                 # License info (MIT)
```
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
A snipit to show a one minuite:
![Alt Text](/images/one_min.png)
A snipit to show a one hour:
![Alt Text](/images/one_hour.png)
A snipit to show a one day:
![Alt Text](/images/one_day.png)

### Transcript Snipit
![Alt Text](/images/Transcript.png)

---

## FPGA Implementation
### Setup
This project is implemented using **Quartus Prime Lite** on **DE10-lite Board**.
#### Steps:
1. Open Quartus and create a new project.
2. Add all files from the rtl/ directory.
3. Set the top-level entity as top.
4. Configure pins according to DE10-Lite constraints.
5. Compile the design and program the board.

#### RTL Viewer:
![Alt Text](/images/rtl_sch.png)

#### Pin Planner:
A snipit of the pin planner window. You can find the `.qsf` in `syn/` in which the pin assigment is done.
![Alt Text](/images/pinplanner.png)

### Demo
![Demo of the clock](/images/demo.gif)

- The left most 2 digits represent HH then MM then SS.
- The right most LED represents PM when high and AM when low.
- The upper push-button represents the active-low reset.
- The right most swithc represents the enable (resume/stop) signal.

# License
This project is licensed under the [MIT License](/LICENSE).

