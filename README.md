# AXI-Stream AI Accelerator with CRC32 Authentication

## Project Overview

High-throughput AI accelerator using the **AXI4-Stream protocol**.  
Lightweight **CRC32 authentication** ensures data integrity.  

- AI kernel: **Multi-Variable Linear Regression (MVLR)**
- Future extension: **Fully Connected Layer**

---

## Multivariable Linear Regression

### Model Definition

The model with four input features is defined as:

$$
y = w_1 x_1 + w_2 x_2 + w_3 x_3 + w_4 x_4 + b
$$

- **Inputs (features)**: 4  
- **Weights**: 4  
- **Bias**: 1  

---

### Example Parameters



w = [0.5, -1.0, 0.25, 0.75]
b = 1.0

| x₁ | x₂ | x₃ | x₄ | y   |
|----|----|----|----|-----|
| 1  | 2  | 3  | 4  | 6.75 |
| 2  | 0  | 1  | 3  | 9.0  |
| 0  | 1  | 2  | 1  | 1.75 |
| 3  | 2  | 0  | 2  | 6.0  |

---

## Fully Connected Neural Network

### Architecture

- **Input Layer**: 4 inputs  
- **Hidden Layer**: 3 neurons  
- **Output Layer**: 1 neuron  



$$
\begin{aligned}
h_1 &= w_{11}x_1 + w_{12}x_2 + w_{13}x_3 + w_{14}x_4 + b_1 \\
h_2 &= w_{21}x_1 + w_{22}x_2 + w_{23}x_3 + w_{24}x_4 + b_2 \\
h_3 &= w_{31}x_1 + w_{32}x_2 + w_{33}x_3 + w_{34}x_4 + b_3
\end{aligned}
$$


$$
y = v_1 h_1 + v_2 h_2 + v_3 h_3 + b_o
$$



### Parameters Summary

| Layer | Weights | Biases |
|------|--------|--------|
| Hidden Layer | 12 | 3 |
| Output Layer | 3 | 1 |
| **Total** | **15** | **4** |

| x₁ | x₂ | x₃ | x₄ | y |
|----|----|----|----|----|
| 1 | 2 | 3 | 4 | 1.84 |
| 0 | 1 | 2 | 1 | -0.12 |
| 2 | 0 | 1 | 3 | 2.45 |
| 3 | 2 | 0 | 2 | 1.67 |



$$
W_{hidden} =
\begin{bmatrix}
0.5 & -0.2 & 0.1 & 0.4 \\
1.0 & 0.3 & -0.5 & 0.2 \\
-0.3 & 0.8 & 0.6 & -0.1
\end{bmatrix}
$$

$$
b_{hidden} =
\begin{bmatrix}
0.1 & -0.2 & 0.05\\
\end{bmatrix}
$$

$$
v =
\begin{bmatrix}
0.7 & -1.2 & 0.5\\
\end{bmatrix}
$$

$$
b_out = 0.3
$$

