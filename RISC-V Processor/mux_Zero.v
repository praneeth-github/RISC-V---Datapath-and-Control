module MUX_Zero(pc_next1,pc,Zero,O);
	input [63:0] pc_next1;
	input [63:0] pc;
	input Zero;
	output [63:0] O;
	
	reg [63:0] tmp;
	
	
	always @(*)
   begin
		case(Zero)
			1'b0:
				tmp = pc_next1;
			1'b1:
				tmp = pc;
		endcase
	end
	
	assign O = tmp;

endmodule 