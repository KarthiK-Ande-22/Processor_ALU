`include "or.v"
module tb_OR_64_bit;

    reg [63:0] a;
    reg [63:0] b;
    wire [63:0] or_ab;

    // Instantiate the OR_64_bit module
    OR_64_bit uut (
        .a(a),
        .b(b),
        .or_ab(or_ab)
    );

    initial begin
        // Test case 1: Both inputs are all zeros
        a = 64'b0;
        b = 64'b0;
        #10;
        $display("Test 1: a=%b, b=%b => or_ab=%b", a, b, or_ab);

        // Test case 2: One input is all ones, the other is all zeros
        a = 64'hFFFFFFFFFFFFFFFF;
        b = 64'b0;
        #10;
        $display("Test 2: a=%b, b=%b => or_ab=%b", a, b, or_ab);

        // Test case 3: Both inputs are all ones
        a = 64'hFFFFFFFFFFFFFFFF;
        b = 64'hFFFFFFFFFFFFFFFF;
        #10;
        $display("Test 3: a=%b, b=%b => or_ab=%b", a, b, or_ab);

        // Test case 4: Random patterns
        a = 64'hAA55AA55AA55AA55;
        b = 64'h55AA55AA55AA55AA;
        #10;
        $display("Test 4: a=%b, b=%b => or_ab=%b", a, b, or_ab);

        // Test case 5: Alternating bits
        a = 64'hAAAAAAAAAAAAAAAA;
        b = 64'h5555555555555555;
        #10;
        $display("Test 5: a=%b, b=%b => or_ab=%b", a, b, or_ab);

        // Finish simulation
        $finish;
    end

endmodule
