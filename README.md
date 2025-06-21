# 8-bit RTL Microprocessor Design in Verilog

![Language](https://img.shields.io/badge/Language-Verilog-blue.svg)

This repository contains the synthesizable Verilog HDL code for a custom-designed 8-bit microprocessor. The project was developed as part of a digital systems course, demonstrating a fundamental understanding of computer architecture, Register-Transfer Level (RTL) design, and functional verification.

The processor is designed from the ground up, featuring a custom Instruction Set Architecture (ISA) capable of performing arithmetic, logical, and control flow operations.

## Key Features

-   **Modular RTL Design**: The processor is built using distinct, reusable modules for the ALU, Register File, Program Memory, and Control Unit.
-   **Custom Instruction Set Architecture (ISA)**: A unique 8-bit ISA was developed to support a range of operations, including arithmetic (`ADD`, `SUB`, `MUL`), logical shifts, comparisons (`CMP`), and control flow (`BR`, `RET`).
-   **8-bit Datapath**: All data operations and storage paths are 8 bits wide.
-   **Component-based Architecture**:
    -   **ALU**: Performs arithmetic and logical operations.
    -   **Register File**: Contains 16 general-purpose 8-bit registers.
    -   **Program Memory**: Stores the machine code instructions to be executed.
-   **Comprehensive Verification**: Each module and the final integrated processor were validated using dedicated Verilog testbenches to ensure correct functionality.

## Processor Block Diagram

The block diagram below illustrates the high-level architecture and the data flow between the core components of the microprocessor.

![Processor Block Diagram](![image](BlockDiagram.png)
)`


## Instruction Set Architecture (ISA)

The processor uses a custom 8-bit ISA. The 4 most significant bits (MSBs) typically define the opcode, while the 4 least significant bits (LSBs) often specify a register address or immediate value.

| Mnemonic      | Opcode (`[7:4]`) | Operand (`[3:0]`)  | Description                                        |
| :------------ | :--------------- | :----------------- | :------------------------------------------------- |
| **Arithmetic & Logical** |
| `ADD Ri`      | `0001`           | Register Address   | `ACC = ACC + Reg[i]`                               |
| `SUB Ri`      | `0010`           | Register Address   | `ACC = ACC - Reg[i]`                               |
| `MUL Ri`      | `0011`           | Register Address   | `ACC = ACC * Reg[i]` (8 LSBs of result)            |
| `AND Ri`      | `0101`           | Register Address   | `ACC = ACC & Reg[i]`                               |
| `XRA Ri`      | `0110`           | Register Address   | `ACC = ACC ^ Reg[i]`                               |
| `CMP Ri`      | `0111`           | Register Address   | Compares `ACC` with `Reg[i]`, sets Carry Bit (CB)  |
| **Data Transfer** |
| `MOV ACC, Ri` | `1001`           | Register Address   | Move data from Register to Accumulator (`ACC = Reg[i]`) |
| `MOV Ri, ACC` | `1010`           | Register Address   | Move data from Accumulator to Register (`Reg[i] = ACC`) |
| **Shift & Increment** |
| `LSL ACC`     | `0000`           | `0001`             | Logical Shift Left ACC by 1                          |
| `LSR ACC`     | `0000`           | `0010`             | Logical Shift Right ACC by 1                         |
| `INC ACC`     | `0000`           | `0110`             | Increment Accumulator (`ACC = ACC + 1`)              |
| `DEC ACC`     | `0000`           | `0111`             | Decrement Accumulator (`ACC = ACC - 1`)              |
| **Control Flow** |
| `Br addr`     | `1000`           | Jump Address       | Branch to `addr` if Carry Bit is set (`PC = addr`)   |
| `RET addr`    | `1011`           | Return Address     | Return to `addr`                                   |
| `HLT`         | `1111`           | `1111`             | Halt processor execution                           |
| `NOP`         | `0000`           | `0000`             | No operation                                       |

## Simulation and Verification

The functionality of each module and the integrated processor was verified using dedicated Verilog testbenches (`*_tb.v`). The simulations cover various programs and scenarios, including:
-   Basic arithmetic and logic operations.
-   Data transfer between registers and the accumulator.
-   Conditional branching and halting.
-   Execution of sequential programs stored in program memory.

