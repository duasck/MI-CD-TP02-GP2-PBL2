module DFF (
    input clk,
    input reset,
    input d,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module FullAdder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign {cout, sum} = a + b + cin;
endmodule

module counter4Bit (
    input clk,
    input reset,
    output [3:0] count
);
    wire [3:0] q;
    wire [3:0] d;
    wire [3:0] cout;
    
    // Full Adders
    FullAdder fa0 (.a(q[0]), .b(1'b1), .cin(1'b0), .sum(d[0]), .cout(cout[0]));
    FullAdder fa1 (.a(q[1]), .b(1'b0), .cin(cout[0]), .sum(d[1]), .cout(cout[1]));
    FullAdder fa2 (.a(q[2]), .b(1'b0), .cin(cout[1]), .sum(d[2]), .cout(cout[2]));
    FullAdder fa3 (.a(q[3]), .b(1'b0), .cin(cout[2]), .sum(d[3]), .cout(cout[3]));
    
    // D Flip-Flops
    DFF dff0 (.clk(clk), .reset(reset), .d(d[0]), .q(q[0]));
    DFF dff1 (.clk(clk), .reset(reset), .d(d[1]), .q(q[1]));
    DFF dff2 (.clk(clk), .reset(reset), .d(d[2]), .q(q[2]));
    DFF dff3 (.clk(clk), .reset(reset), .d(d[3]), .q(q[3]));
    
    assign count = q;
	 
endmodule
