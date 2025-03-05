## Exercise 1: Introduction to Verilog and Digital Design

In this lab, you'll be introduced to Hardware Description Languages (HDLs) and Verilog. You will design and simulate your first digital circuit: a simple AND gate. This lab is not a comprehensive guide to Verilog, so to gain a deeper understanding of the fundamentals, you should refer to the provided Verilog guide or consult additional resources online.

#### HDLs vs. Programming Languages

Before we dive into Verilog, let's understand the difference between a HDL and a typical programming language like Python or C.

- **Programming languages** like Python or C are used to create instructions for software that runs on a computer's processor. These instructions are executed sequentially, where the program tells the processor what to do step-by-step.

- **HDLs** like Verilog describe and model the behavior of hardware. Instead of writing a sequence of steps, you’re defining how electronic components like logic gates and registers connect and interact with each other. The goal of HDLs is to design hardware systems, not software programs.

Verilog allows you to design and simulate digital circuits before implementing them on physical hardware (like FPGAs or ASICs). Instead of creating instructions for a processor to execute, you're creating the blueprint for how the hardware itself behaves.

### Part 1: Design an AND gate in Verilog

In this part you will go through a guided exercise to build your first Verilog module, an **AND gate**.

#### What is an AND Gate?

An **AND gate** is a fundamental digital logic gate that outputs a logic high (1) only when all its inputs are high (1). If any of its inputs are low (0), the output will be low (0). The truth table for a 2-input AND gate is as follows:
| Input A |	Input B |	Output (A AND B) |
| ---|---|---|
0	|0|	0
0	|1	|0
1|	0	|0
1	|1|	1

In Verilog, we can model this behavior using a simple module.

#### Declaring the module

In Verilog, most of your files will be modules.
A **module** in Verilog is a building block for your hardware design. It represents a specific piece of hardware, such as an AND gate, a register or a processor. Think of a module as similar to a class in object-oriented programming (OOP).
A module typically consists of three parts:
- **Inputs**: The signals that come into the module.
- **Outputs**: The signals that leave the module.
- **Internal functionality**: How the module processes inputs to produce outputs.

Here is a basic structure for a Verilog module:

```verilog
module my_module (input_1, input_2, output_1);

// Define the input and output ports
input input_1;
input input_2;
output output_1;

// Body of the module where its functionality is defined
// Internal signals declarations and assignemnts

endmodule
```

The module declaration for your **AND gate** should look like this:

```verilog
module and_gate (A, B, Y);

// Define the input and output ports
input A, B;
output Y;

endmodule
```

#### Defining the signals
In Verilog, signals are used to carry information between different parts of your design. There are two main types of signals: `wire` and `reg`.

- **wire**: This is used for connecting continuous assignments and is typically used for combinational logic or when connecting modules. A `wire` signal cannot store a value by itself; it reflects the value of the signal driven onto it, usually from an output or another `wire`. `wire` signals are used when assigning them a value continuosly with an `assign` statement.

- **reg**: This is used for signals that store values, typically in sequential logic. `reg` is used when assigning values inside `always` or `initial` blocks, such as in flip-flops or counters.

Here there are some examples of signals declarations in Verilog:

```verilog
signal_type [size-1:0] signal_name;     // template
wire [7:0] data_in;                     // 8-bit wide wire signal
reg [15:0] addr_out;                    // 16-bit wide reg signal
```

In Verilog, you can specify the type of input and output signals. If not specified, the signal is assumed to be of type `wire`. For this and future labs, always specify the type of input and output signals. For the **AND gate**, no internal signals are needed, so only the types of inputs and outputs will be specified.

```verilog
// Define IO wires and registers 
wire A, B;      // INPUTS - defined as wires in most cases
wire Y;         // OUTPUTS - defined as wire since we will assign it continuosly with an assign statement
```

#### Implementing functionalities (assignments)
In Verilog, assignments are used to define the behavior of signals within your design. There are two main types of assignments: continuous assignments and procedural assignments.

- **Continuous Assignments**: These are used with `wire` signals and are typically used for combinational logic. Continuous assignments are made using the `assign` keyword and are always active, meaning they continuously update the output whenever the input changes. For example:

    ```verilog
    assign res = a | b;  // res is updated whenever a or b changes
    ```

- **Procedural Assignments**: These are used with `reg` signals and are made inside procedural blocks like `always` or `initial`. Procedural assignments are used for sequential logic, such as flip-flops or state machines, and are evaluated only when the block is triggered. We will see some examples on how to use them in the Flip-Flop module and in the testbenches.

Since your **AND gate** is a purely combinational circuit, you can use a continuous assignment along with Verilog's built-in logical operators:
```verilog
assign Y = A & B;   // continously assign to Y the result of AND operation between A and B
```

#### Closing the module

Now your **AND gate** is complete! Remember to close the module with the following statement:
```verilog
endmodule
```

#### Full code

``` verilog
module and_gate (A, B, Y);

// Define the input and output ports
input A, B;
output Y;

// Define IO wires and registers 
wire A, B;      // INPUTS - defined as wires in most cases
wire Y;         // OUTPUTS - defined as wire since we will assign it continuosly with an assign statement

// Internal wires and registers (if any)

// Define the AND gate
assign Y = A & B;

endmodule
```

### Part 2: Build a testbench for the AND gate and simulate it

#### What is a testbench

A **testbench** in Verilog is a simulation environment used to verify the functionality of a design module by applying different input stimuli and observing the outputs. It acts as a wrapper around the **design under test (DUT)**, providing the necessary signals, such as clocks and resets, as well as a series of test cases. The testbench allows designers to validate the behavior of the module without the need for physical hardware, ensuring that it operates as expected before moving on to synthesis or real-world implementation.

#### Declaring the Module
Like any Verilog code, a testbench starts with a module declaration. However, testbenches do not have inputs or outputs since they simply act as wrappers. For your **AND gate**, the testbench would start like this:

```verilog
module and_gate_tb;
```

#### Defining the signals
In the testbench, we need to declare the inputs and the outputs of the **DUT** so that we can send values to the inputs and monitor the outputs to test the functionality. It is common to declare the **inputs** as `reg` since we will assign values to them in a sequential statement (`initial` or `always`) instead of with continuous assignments. Conversely, outputs are usually declared as `wire` because they are continuously driven by the outputs of the DUT. For your **AND gate**, the signals can be declared as follows:

```verilog
reg A, B;  // Inputs for the AND gate
wire Y;    // Output from the AND gate
```

#### Instantiating the DUT

After defining a module, you can instantiate it in another module to reuse its functionality. Instantiating a module is similar to calling a function or creating an instance of a class in software. The basic syntax for doing that is as follows:

```verilog
module_name instance_name (
    .port_name1(signal_name1),  // Connects the module port to a signal
    .port_name2(signal_name2)   // Continue mapping other ports
);
```

In the testbench the DUT, which in this case is the `and_gate` module, must be instantiated to simulate its behavior:

```verilog
and_gate dut (       // Instantiate the AND gate
    .A(A),           // Connect A input to A of and_gate
    .B(B),           // Connect B input to B of and_gate
    .Y(Y)            // Connect Y output to Y of and_gate
);
```

#### Defining the test procedure

To test your DUT, you can use an `initial` block to sequentially assign values to the inputs. Since an **AND gate** is a simple module, you can test all possible input combinations:

```verilog
initial begin
    // Apply test inputs
    A = 0; B = 0; #10;  // Wait 10 time units
    A = 0; B = 1; #10;
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;

    // End simulation
    $finish;
end
```

In this example, different assignments are grouped on the same line for readability. The `#` symbol is used to introduce a delay, causing the block to pause for a specified number of time units (10 in this case) to observe the output response to the input changes. Remember to end the block with the `$finish` statement to properly close the simulation.

#### Close the module

Remember to close the module with:
```verilog
endmodule
```

#### Dumping Variables to a VCD File

To visually analyze the signals in a waveform viewer, we need to save the values of all signals to a Value Change Dump (VCD) file. This is achieved using the `$dumpfile` and `$dumpvars` system tasks:

```verilog
$dumpfile("and.vcd");      // Specify the name of the VCD file
$dumpvars(0, tb_and_gate); // Dump all variables from the testbench module
```

To ensure all signals are correctly saved, add the lines above at the start of the `initial` block in your testbench.

#### Full Code

```verilog
module tb_and_gate;     // Testbench for AND gate

// Internal wires and registers (if any)
reg A, B;               // Registers to store test inputs
wire Y;                 // Wire to capture the output

// Instantiate the AND gate
and_gate dut (
    .A(A),
    .B(B),
    .Y(Y)
);

// Test procedure
initial begin
    $dumpfile("and.vcd");         // Specify the name of the VCD file
    $dumpvars(0, tb_and_gate);    // Dump all variables in the testbench
    // Apply test inputs
    A = 0; B = 0; #10;  // Wait 10 time units
    A = 0; B = 1; #10;
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;

    // End simulation
    $finish;
end

endmodule
```
#### Simulate the design

Now that you've written the code for the AND gate and its testbench, the next step is to simulate them. Simulation is a crucial step in hardware design because it allows you to verify that your design behaves as expected before implementing it in hardware.

To simulate your design using Icarus Verilog, follow these steps:

1. Use the `iverilog` command to compile your Verilog files. This command combines your design (`and.v`) and testbench (`tb_and.v`) into a single executable file.

    ```bash
    iverilog -o and.out and.v tb_and.v
    ```
2. Run the simulation using the `vvp` command. This executes the compiled simulation and generates a Value Change Dump (VCD) file, which records the behavior of all signals during the simulation.

    ```bash
    vvp and.out
    ```

3. The simulation generates a file called `and.vcd`, which contains the waveform data for all signals in your design. To visualize the waveforms, use `GTKWave`.

    ```bash
    gtkwave and.vcd
    ```

    Using the tool is straightforward. In the top-left window, you’ll see the hierarchy of your design. To view the signals, click on a module, and its signals will appear at the bottom. To visualize them, right-click and select "Append" or simply drag the signals into the right window.

### Part 3: Design a generic 4-to-1 multiplexer in Verilog

Now you will design a 4-to-1 multiplexer in Verilog. This exercise will introduce you to generic modules and their usage. Specifically, you will create a 4-to-1 multiplexer that can handle signals of arbitrary width, eliminating the need to design a new module for different signal sizes.

#### What is a multiplexer

A **multiplexer (Mux)** is a digital circuit that selects one of several input signals and forwards it to a single output line based on a control signal called the select signal. It acts as a data selector, enabling multiple inputs to share a single output resource. Multiplexers are widely used in digital systems for routing data, reducing wiring complexity.

![](https://upload.wikimedia.org/wikipedia/commons/6/66/Multiplexer.png)

| Select (S) | Input A | Input B | Output Y |
|------------|---------|---------|----------|
|     0      |    A    |    B    |    A     |
|     1      |    A    |    B    |    B     |

#### Defining the generic module

**Generic modules** in Verilog are reusable and configurable modules that can be adapted to different design requirements without modifying the module's internal code. This is achieved using **parameters**, which allow you to define customizable attributes such as bit-widths, sizes, or other design-specific values. By using parameters, you can create a single module that can be instantiated multiple times with different configurations, making your code more modular, scalable, and easier to maintain. Parameters are typically defined using the parameter keyword and can be overridden during module instantiation.

```verilog
module generic_module #(
    parameter WIDTH = 8,  // Default parameter value
) (data_in, address, data_out);

// Define the input and output ports
input  [WIDTH-1:0] data_in;   // Input port with configurable width
input  [DEPTH-1:0] address;   // Input port with configurable depth
output [WIDTH-1:0] data_out;  // Output port with configurable width

// Define IO wires and registers 
wire  [WIDTH-1:0] data_in;
wire  [DEPTH-1:0] address;  
reg   [WIDTH-1:0] data_out;  

// Internal wires and registers (if any)
reg [WIDTH-1:0] int_signal;  // Memory array with configurable size
//....

endmodule
```

The module declaration for your **Mux** should be similar to this:
```verilog
module mux_4to1 #(parameter WIDTH = 8) (a, b, c, d, sel, y);

// Define the input and output ports
input  [WIDTH-1:0] a;    // Input a
input  [WIDTH-1:0] b;    // Input b
input  [WIDTH-1:0] c;    // Input c
input  [WIDTH-1:0] d;    // Input d
input  [1:0] sel;        // Select signal
output [WIDTH-1:0] y;    // Output y

// Define IO wires and registers 
wire [WIDTH-1:0] a;     // Input a
wire [WIDTH-1:0] b;     // Input b
wire [WIDTH-1:0] c;     // Input c
wire [WIDTH-1:0] d;     // Input d
wire [1:0] sel;         // Select signal
wire [WIDTH-1:0] y;     // Output y
```

#### Implementing the functionality

The logic for implementing a multiplexer is straightforward. You can use a continuous assignment with a conditional operator as shown below:
```verilog
// Implement the functionality using a conditional operator
assign y = (sel == 2'b00) ? a : 
           (sel == 2'b01) ? b : 
           (sel == 2'b10) ? c : 
           (sel == 2'b11) ? d : 0;
```

#### Full Code

The complete code for the generic multiplexer is:
```verilog
module mux_4to1 #(parameter WIDTH = 8) (a, b, c, d, sel, y);

// Define the input and output ports
input  [WIDTH-1:0] a;    // Input a
input  [WIDTH-1:0] b;    // Input b
input  [WIDTH-1:0] c;    // Input c
input  [WIDTH-1:0] d;    // Input d
input  [1:0] sel;        // Select signal
output [WIDTH-1:0] y;    // Output y

// Define IO wires and registers 
wire [WIDTH-1:0] a;     // Input a
wire [WIDTH-1:0] b;     // Input b
wire [WIDTH-1:0] c;     // Input c
wire [WIDTH-1:0] d;     // Input d
wire [1:0] sel;         // Select signal
wire [WIDTH-1:0] y;     // Output y

// Implement the functionality using a conditional operator
assign y = (sel == 2'b00) ? a : 
           (sel == 2'b01) ? b : 
           (sel == 2'b10) ? c : 
           (sel == 2'b11) ? d : 0;

endmodule
```

### Part 3: Build a testbench for the Mux and simulate it

As always, to verify the designed module, you need a testbench. The steps to build it are almost the same as before, with the addition of specifying the value for the DUT parameter. To keep the code clean, we will declare the parameter and pass it separately to the module:

```verilog
localparam WIDTH = 8;
// Instantiate the Device Under Test (DUT)
// mux_4to1 dut (               // NO PARAMETER
mux_4to1 #(WIDTH) dut (         // PARAMETER
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .sel(sel),
    .y(y)
);
```

In Verilog, `localparam` is used to define constants that are local to a module and cannot be overridden from outside the module. This is useful for defining internal constants that should not be modified by other modules or during instantiation.

#### Full Code

The rest of the testbench follows the same principles as before, so let's review the complete code:
```verilog
module tb_mux_4to1;

    // Parameters
    localparam WIDTH = 8;

    // Inputs
    reg  [WIDTH-1:0] a;
    reg  [WIDTH-1:0] b;
    reg  [WIDTH-1:0] c;
    reg  [WIDTH-1:0] d;
    reg  [1:0]       sel;

    // Outputs
    wire [WIDTH-1:0] y;

    // Instantiate the Device Under Test (DUT)
    mux_4to1 #(WIDTH) dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .y(y)
    );

    // Testbench logic
    initial begin
        $dumpfile("mux_4to1.vcd");    // Specify the name of the VCD file
        $dumpvars(0, tb_mux_4to1);    // Dump all variables in the testbench

        // Initialize inputs
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        sel = 2'b00;

        // Apply test cases
        #10 a = 8'hAA; b = 8'hBB; c = 8'hCC; d = 8'hDD; // Assign unique values to inputs
        // Test case 1: sel = 2'b00 (select a)
        sel = 2'b00;
        #10;
        // Test case 2: sel = 2'b01 (select b)
        sel = 2'b01;
        #10;
        // Test case 3: sel = 2'b10 (select c)
        sel = 2'b10;
        #10;
        // Test case 4: sel = 2'b11 (select d)
        sel = 2'b11;
        #10;

        // End simulation
        $finish;
    end

endmodule
```

### Part 4: Design a D Flip-Flop in Verilog (Sequential Circuit)

Now it's time to delve into sequential logic and learn how to design its simplest example, the D flip-flop.

#### Combinational vs. Sequential Logic

In digital design, we classify circuits into two main types: combinational and sequential.

- **Combinational Logic**: In combinational circuits, the output depends only on the current inputs. These circuits have no memory and perform tasks such as logic gates or arithmetic operations. Examples include adders and multiplexers. All the components you've design until now are combinational.

- **Sequential Logic**: Sequential circuits have memory, meaning their output depends not only on the current inputs but also on previous states (history). These circuits require a **clock signal** to function, and their behavior changes at every clock cycle. Examples include flip-flops, counters, and shift registers. It is a good practice to provide also a **reset** signal which is used to bring the component back to its initial state. 

#### Flip-Flops (FF)

A flip-flop is the basic memory element in sequential logic. It stores a single bit (either 0 or 1) and changes its state based on a clock signal. There are different types of flip-flops, the most commonly used in digital design are D flip-flops.

In this lab, we will use a D flip-flop, where:

- `D` is the data input.
- `Q` is the output.
- At every clock pulse, the value at input `D` is stored and appears at output `Q`.

![](https://cdn.shopify.com/s/files/1/0823/6200/7871/files/d_flip_flop_symbol_480x480.png?v=1719270190)

#### Module Declaration
The module declaration for sequential circuits is similar to that of combinational circuits, with the key difference being the inclusion of clock and reset signals.

```verilog
module dff (clk, rst, d, q);

// Define the input and output ports
input clk;
input rst;
input d;
output q;

// Define IO wires and registers
wire clk, rst, d;  // INPUTS - defined as wires
reg q;             // OUTPUT - defined as reg since it is assigned in an always block
```

#### Functionality Implementation

To correctly implement the D Flip-Flop, we use the `always` statement in Verilog. This statement continuously runs, unlike the `initial` statement, which stops once it reaches the end. The `always` statement can be accompanied by a list of signals known as the **sensitivity list**. This means that the body of the block should execute each time one of those signals changes.

```verilog
always @(signal_1 or signal_2 or ...) begin
    // Body of the always block
end
```

For sequential circuits with clock and reset, it is common to have `@(posedge clk or posedge rst)` as the sensitivity list because they should react only when the clock or reset signal has a positive edge. To implement the D Flip-Flop functionalities, we can use the following code:

```verilog
// Define the flip-flop behavior
always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 1'b0;
    end else begin
        q <= d;
    end
end
```

#### Full Code

The full code for your D Flip-Flop is the following:
```verilog
module dff (clk, rst, d, q);

// Define the input and output ports
input clk;
input rst;
input d;
output q;

// Define IO wires and registers
wire clk, rst, d;  // INPUTS - defined as wires
reg q;             // OUTPUT - defined as reg since it is assigned in an always block

// Define the flip-flop behavior
always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 1'b0;
    end else begin
        q <= d;
    end
end

endmodule
```

### Part 5: Build the D-FF testbench and simulate it

The testbench for a sequential circuit is similar to that of a combinational circuit, but it includes a **clock** signal and a **reset** signal. The clock signal controls the circuit's timing and typically oscillates between 0 and 1 in a square wave pattern. To implement the **clock** signal in a testbench:

- Initialize it in the `initial` block.
- Create an `always` block to toggle the clock signal every half period.

```verilog
// Clock signal
reg clk;  // Define the clock as reg since we assign it in an always/initial block
always begin
    #5 clk = ~clk;  // Toggle clock every 5 time units
end
// ....
initial begin
    // Initialize inputs
    clk = 0;
    rst = 0;
    // ...
end
```

The `#5` statement delays the block's execution by 5 time units, creating a square wave with a 10 time unit period (5 units high and 5 units low).

#### Full Code

```verilog
module tb_dff;     // Testbench for Flip-Flop

reg clk, rst, d;  // Registers to store test inputs
wire q;           // Wire to capture the output

// Instantiate the Flip-Flop
dff dut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;  // Toggle clock every 5 time units

// Test procedure
initial begin
    $dumpfile("dff.vcd");         // Specify the name of the VCD file
    $dumpvars(0, tb_dff);         // Dump all variables in the testbench

    // Initialize inputs
    clk = 0; rst = 0; d = 0;

    // Apply test inputs
    rst = 1; #10;  // Reset the flip-flop
    rst = 0; d = 1; #10;  // Set d to 1
    d = 0; #10;  // Set d to 0
    d = 1; #10;  // Set d to 1

    // End simulation
    $finish;
end

endmodule
```

- - -

#### Next Exercise
- [Exercise 2: Building a Full Adder in Verilog](../Ex2_FullAdder/README.md)
