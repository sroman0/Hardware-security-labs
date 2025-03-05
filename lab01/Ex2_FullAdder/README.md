## Exercise 2: Building a Full Adder in Verilog

In this exercise, you will design and simulate a Full Adder using Verilog. The Full Adder is a key component in digital circuits, used for performing binary addition. To ensure the module works correctly, you will also create a testbench for verification.

### Part 1 - Design a Full Adder

A Full Adder adds three 1-bit binary numbers: a, b, and cin (carry-in) and it produces two outputs:
- **sum**: the result of the addition.
- **cout**: the carry-out bit, which is used if the sum exceeds the value that can be represented by a single bit (i.e., 2).

##### Truth Table

The Full Adder can be described by the following truth table:
| a	| b	| cin	| sum	| cout | 
|-----|-----|:-----:|:-----:|:-----:|
| 0	| 0	| 0	    | 0	    | 0    |
| 0	| 0	| 1	    | 1	    | 0    |
| 0	| 1	| 0	    | 1	    | 0    |
| 0	| 1	| 1	    | 0	    | 1    |
| 1	| 0	| 0	    | 1	    | 0    |
| 1	| 0	| 1	    | 0	    | 1    |
| 1	| 1	| 0	    | 0	    | 1    |
| 1	| 1	| 1	    | 1	    | 1    |

##### Full Adder Equations

From the truth table, we can derive the following logic equations:
```
sum = a ⊕ b ⊕ cin (the XOR of the three inputs)
cout = (a & b) | (b & cin) | (a & cin) (carry out is true if at least two of the three inputs are true)
```

Your task is to implement these equations in Verilog to create a Full Adder module.

### Part 2 - Build a testbench for the Full Adder and simulate it

To verify the correct operation of your Full Adder, you should design a testbench and test it, following the same steps outlined in the previous exercise.

- - -

#### Previous Exercise
- [Exercise 1: Introduction to Verilog and Digital Design](../Ex1_HDLIntro/README.md)

#### Next Exercise
- [Exercise 3: Building a Ripple Carry Adder using Full Adders](../Ex3_RippleCarryAdder/README.md)