# 4-Bit Linear Feedback Shift Register (LFSR)

A Verilog implementation of a 4-bit Linear Feedback Shift Register (LFSR) designed for pseudo-random number generation and digital logic testing.

## Overview

This module implements a 4-bit shift register where the input bit is driven by a linear function of its previous state. The feedback logic uses specific "taps" to create a sequence of states that cycle through a pseudo-random pattern.



### Features
- **Deterministic Randomness:** Generates a predictable sequence of bits based on the initial seed.
- **Self-Starting:** Includes a reset signal to initialize the register to `4'b0001`.
- **Lightweight:** Minimal resource usage, ideal for FPGA and ASIC implementation.

---

## Technical Specifications

### Module Interface

| Port | Direction | Width | Description |
| :--- | :--- | :--- | :--- |
| `clk` | Input | 1 | System clock (Rising-edge triggered). |
| `rst` | Input | 1 | Active-high asynchronous/synchronous reset. |
| `data_out` | Output | 4 | Current 4-bit state of the register. |

### Logic Implementation

The module uses a **Many-to-One** (Fibonacci) structure. The feedback bit is calculated by XORing the bits at positions 3, 2, and 1:

$$feedback = lfsr\_reg[3] \oplus lfsr\_reg[2] \oplus lfsr\_reg[1]$$

On every clock cycle, the register shifts left, and the result of the feedback logic is shifted into the Least Significant Bit (LSB):

$$lfsr\_reg \Leftarrow \{lfsr\_reg[2:0], feedback\}$$

---

