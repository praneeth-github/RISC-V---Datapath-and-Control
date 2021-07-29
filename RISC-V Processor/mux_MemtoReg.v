module MUX_MemtoReg(readdata,ALUresult,MemtoReg,O);
	input [63:0] readdata;
	input [63:0] ALUresult;
	input MemtoReg;
	output [63:0] O;
	
	reg [63:0] tmp;
	
	
	always @(*)
   begin
		case(MemtoReg)
			1'b1:
				tmp = readdata;
			1'b0:
				tmp = ALUresult;
		endcase
	end
	
	assign O = tmp;

endmodule