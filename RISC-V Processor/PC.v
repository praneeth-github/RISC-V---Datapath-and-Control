module PC(clk, reset, pcnext, pc);
	input [63:0] pcnext;
	input reset;
	input clk;
	output reg [63:0] pc;
always @(posedge clk or reset or pc)
begin
    if(reset==0 & clk==1)
        pc <= pcnext;
    else if(reset==1)
       pc <= -4;
end
initial
begin
        if(reset==1)
    pc <= 0;
end
endmodule

