# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names medard and abe group 15

## Summary
In Lab 11, my lab partner and I learned how to make clock dividers with modulo and ripple counters. We studied how D and T flip-flops work together to count clock pulses and slow clock signals. We also practiced using Verilog and testing our circuits on the Basys 3 board. Overall, this lab helped us understand counters, flip-flops, and their role in digital circuits.

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
The counter changes its output every Count cycles, so it takes 2 × Count cycles to complete one full cycle.

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
The output is all 1s because of how the counter is initialized and how its feedback works.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?
The result depends on the input clock frequency. With a 50 MHz clock, a 25,000-bit Johnson ring counter runs at about 1 kHz.
