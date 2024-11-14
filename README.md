# FSM Sequence Detector for Pattern 01111110

This project implements a Finite State Machine (FSM) in Verilog to detect the specific bit pattern `01111110`. 
The FSM outputs a high signal (`y = 1`) when this sequence is detected. 
This type of sequence detector is commonly used in digital communication and error detection systems.

## Overview

The FSM checks an input bit stream (`w`) on each clock cycle and transitions between predefined states to detect the pattern `01111110`. The FSM uses nine states (S0 to S8) to track progress through the pattern. When the pattern is matched, the output `y` is set to high (`1`).

## Diagrams

### RTL Diagram

Below is the RTL (Register Transfer Level) diagram representing the design structure.

![Screenshot 2024-11-12 003730](https://github.com/user-attachments/assets/efa596fb-e30d-4b5e-9447-f3b500d0c81c)


### FSM State Diagram

The FSM uses the following states to track the pattern sequence:


![Screenshot 2024-11-12 003755](https://github.com/user-attachments/assets/47d4380e-a74c-4725-8a23-1b998f2e7247)


- **S0**: Initial state, waiting for the sequence to start.
- **S1**: Detects the first `0`.
- **S2**: Detects the first `1` after the starting `0`.
- **S3** to **S7**: Continue detecting `1`s in the sequence.
- **S8**: Final state, expecting `0` to complete the sequence `01111110`.

If an unexpected bit is detected, the FSM resets to an earlier state based on the sequence requirements.

## Files

- **FSM.sv**: Contains the Verilog code for the FSM sequence detector.
- **tb_FSM.sv**: Testbench for the FSM, used to validate the design.
- **README.md**: Project documentation (this file).

## Getting Started

### Prerequisites

You need a Verilog simulator (such as ModelSim, Xilinx Vivado, or Synopsys VCS) to compile and simulate this project.

### Cloning the Repository

Clone the repository to your local machine:

```bash
git clone "https://github.com/MuhammadAun-gif/Sequence-Detector"
