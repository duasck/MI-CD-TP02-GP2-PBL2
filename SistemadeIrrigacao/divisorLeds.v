module divisorLeds (
    input wire clk,
    input wire reset,
    output wire clkLeds
);

	wire [14:0] d;
	wire [14:0] q;

	// Instanciando os flip-flops D
	d_ff dff_0  (.clk(clk),     .reset(reset), .d(~q[0]),  .q(q[0]));
	d_ff dff_1  (.clk(q[0]),    .reset(reset), .d(~q[1]),  .q(q[1]));
	d_ff dff_2  (.clk(q[1]),    .reset(reset), .d(~q[2]),  .q(q[2]));
	d_ff dff_3  (.clk(q[2]),    .reset(reset), .d(~q[3]),  .q(q[3]));
	d_ff dff_4  (.clk(q[3]),    .reset(reset), .d(~q[4]),  .q(q[4]));
	d_ff dff_5  (.clk(q[4]),    .reset(reset), .d(~q[5]),  .q(q[5]));
	d_ff dff_6  (.clk(q[5]),    .reset(reset), .d(~q[6]),  .q(q[6]));
	d_ff dff_7  (.clk(q[6]),    .reset(reset), .d(~q[7]),  .q(q[7]));
	d_ff dff_8  (.clk(q[7]),    .reset(reset), .d(~q[8]),  .q(q[8]));
	d_ff dff_9  (.clk(q[8]),    .reset(reset), .d(~q[9]),  .q(q[9]));
	d_ff dff_10 (.clk(q[9]),    .reset(reset), .d(~q[10]), .q(q[10]));
	d_ff dff_11 (.clk(q[10]),   .reset(reset), .d(~q[11]), .q(q[11]));
	d_ff dff_12 (.clk(q[11]),   .reset(reset), .d(~q[12]), .q(q[12]));
	d_ff dff_13 (.clk(q[12]),   .reset(reset), .d(~q[13]), .q(q[13]));
	d_ff dff_14 (.clk(q[13]),   .reset(reset), .d(~q[14]), .q(q[14]));
	d_ff dff_15 (.clk(q[14]),   .reset(reset), .d(~clkLeds), .q(clkLeds));

endmodule
