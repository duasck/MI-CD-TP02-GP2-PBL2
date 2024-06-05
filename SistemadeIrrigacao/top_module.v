module top_module (
    input wire clk,
    input wire reset,
    input wire load,
    input wire [7:0] load_minutes,
    input wire [7:0] load_seconds,
    output wire [6:0] seg,
    output wire [3:0] an
);
    wire clk_1hz;
    wire uso, umo, dso, dmo;
	 wire carry0, carry1, carry2, carry3;
    // Instanciação dos módulos
// clk,load, d, up_down, cten, q, rco, max_min

    divisor_clk divisor (
        .clk(clk),
        .rstn(reset),
        .out(clk_1hz)
    );
	//load 1, cten 0, up_down 1
	/*wire [3:0] f1 ;
	assign f0 = 1001;
	assign l0 = */
	wire l0;
	initial l0 = 1
    down_count us (
        .clk(clk_1hz),
        .load(l0),
        .d(f0),
        .up_down(1),
        .cten(0),
        .q(uso),
		  .rco(),
		  .max_min(carry0)
    );

	 /*assign l0 = 
    down_count ds (
        .clk(carry0),
        .load(1),
        .d(0101),
        .up_down(1),
        .cten(0),
        .q(dso),
		  .rco(),
		  .max_min(carry1)
    );
	 
   down_count um (
        .clk(clk_1hz),
        .load(1),
        .d(1001),
        .up_down(1),
        .cten(0),
        .q(umo),
		  .rco(),
		  .max_min(carry2)
    );
	 
	 down_count dm (
        .clk(clk_1hz),
        .load(1),
        .d(0010),
        .up_down(1),
        .cten(0),
        .q(dmo),
		  .rco(),
		  .max_min(carry3)
    );*/
	 
endmodule
