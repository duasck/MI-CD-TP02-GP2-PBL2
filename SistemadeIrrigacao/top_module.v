
module top_module (
    input wire clk,
    input [3:0] iUseg,
	// input [3:0] iDseg,
	 input loa,
    output wire [3:0] Useg,
    //output wire [3:0] Dseg,
	 output carryout0,
	output carryout1,
	 output pulse1
);
    wire clk_1hz;
    wire [3:0] uso, umo, dso, dmo;
	 wire carry0, carry1, carry2, carry3;
	 
    // Instanciação dos módulos
// clk,load, d, up_down, cten, q, rco, max_min

    /*	freq_1 divisor (
        .clk(clk),
        .clk_out(clk_1hz)
    );
	 
	//load 1, cten 0, up_down 1
	// gatilho (.clk, .shift_in, .reset, .q, .stop)*/

//gatilho g (.clk(clk), .reset(1), .stop(pulse1));
	//not (n0, pulse1);

	
    down_count us (
        .clk(clk),
        .load(1),
        .d(iUseg),
        .up_down(1),
        .cten(0),
        .q(uso),
		  .rco(temp),
		  .max_min(carry0)
    );
	 
	 assign Useg = uso;
	 wire temp;
	 assign carryout0 = temp;
	 assign carryout1 = carry0;
	 
	/*  assign Useg = uso;
	
    down_count ds (
        .clk(carry0),
        .load(pulse1),
        .d(iDseg),
        .up_down(1),
        .cten(0),
        .q(dso),
		  .rco(),
		  .max_min(carry1)
    );
	 
	 assign Dseg = dso;
	
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
    ); 
	 */
endmodule
