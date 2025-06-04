// Author: Alessio Caviglia
// File: tb_and.v
// Description: Testbench for the AND gate
// Module: tb_and_gate
// Inputs: none
// Outputs: none

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