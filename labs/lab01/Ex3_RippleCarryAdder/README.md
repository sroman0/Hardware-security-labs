## Exercise 3: Building a Ripple Carry Adder using Full Adders

In this exercise, you'll use the Full Adder module from [Exercise 2](./Ex2_FullAdder/README.md) to construct a Ripple Carry Adder in Verilog. A Ripple Carry Adder is a multi-bit adder that links several full adders together to add binary numbers that are more than 1-bit wide.

#### What is a Ripple Carry Adder

A Ripple Carry Adder adds two multi-bit binary numbers by cascading multiple full adders. Each full adder handles one bit of the two numbers and passes any carry bit to the next full adder in the chain. This "rippling" of the carry bit through the adders is how the Ripple Carry Adder works.

For example, a 4-bit Ripple Carry Adder consists of 4 full adders. The carry-out of one full adder is passed as the carry-in to the next full adder.

![](https://vlsiverify.com/wp-content/uploads/2022/11/ripple_carry_adder.jpg)

#### Task Description

Your task is to:
- **Create a new Verilog module** called `ripple_carry_adder` that uses the `full_adder` module from Exercise 2 to implement a **4-bit Ripple Carry Adder**.
- **Test the module** with the provided testbench and Makefile (check that files/modules names match).

- - -

#### Previous Exercise
- [Exercise 2: Building a Full Adder in Verilog](../Ex2_FullAdder/README.md)

#### Next Exercise
- [Exercise 4: Building a Counter (Sequential Logic)](../Ex4_Counter/README.md)