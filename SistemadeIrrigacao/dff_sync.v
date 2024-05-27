module dff_sync (clk,reset,d,q);
input clk,reset,d;
output reg q;

always @ (posedge clk)begin
    if(reset)
        q <= 0; // reset com 1
    else
        q <= d;
end
                
endmodule
