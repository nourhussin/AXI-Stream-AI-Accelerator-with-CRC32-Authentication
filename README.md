# AXI-Stream-AI-Accelerator-with-CRC32-Authentication
Project Overview  High-throughput AI accelerator using AXI4-Stream protocol.  Lightweight CRC32 authentication ensures data integrity.  AI kernel: Multi-Variable Linear Regression (MVLR).  Future extension: Fully Connected Layer.

## Multivariable Linear Regression (4 Variables)

### Model Definition

The model with four input features is defined as:

\[
y = w_1 x_1 + w_2 x_2 + w_3 x_3 + w_4 x_4 + b
\]

- **Inputs (features)**: 4  
- **Weights**: 4  
- **Bias**: 1  

---

### Example

| x₁ | x₂ | x₃ | x₄ | y   |
|----|----|----|----|-----|
| 1  | 2  | 3  | 4  | 6.75 |
| 2  | 0  | 1  | 3  | 9.0  |
| 0  | 1  | 2  | 1  | 1.75 |
| 3  | 2  | 0  | 2  | 6.0  |

---
