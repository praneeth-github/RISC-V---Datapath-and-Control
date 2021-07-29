module MUX_ALUSrc(readdata2,immed,ALUSrc,O);
	input [63:0] readdata2;
	input [63:0] immed;
	input ALUSrc;
	output [63:0] O;
	
	reg [63:0] tmp;
	
	
	always @(*)
   begin
		case(ALUSrc)
			1'b0:
				tmp = readdata2;
			1'b1:
				tmp = immed;
		endcase
	end
	
	assign O = tmp;

endmodule 