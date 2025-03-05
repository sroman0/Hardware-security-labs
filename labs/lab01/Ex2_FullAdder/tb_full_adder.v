

module tb_full_adder;

    // Inputs
    reg a;
    reg b;
    reg cin;

    // Outputs
    wire sum;
    wire cout;

    // Instantiate the Device Under Test (DUT)
    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Testbench logic
    initial begin
        $dumpfile("full_adder.vcd");    // Specify the name of the VCD file
        $dumpvars(0, tb_full_adder);    // Dump all variables in the testbench

        // Initialize inputs
        a = 0;
        b = 0;
        cin = 0;

        // Apply test cases
        a = 0; b = 0; cin = 0; #10;  // Wait 10 time units
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;
        // End simulation
        $finish;
    end
endmodule