
module datamem(address,writedata,MemWrite,MemRead,readdata);

	input [63:0] address;
	input [63:0] writedata;
	input MemWrite;
	input MemRead;
	output [63:0] readdata;
	
	reg [63:0] mm[0:31];
	
	initial
	begin
		
		$readmemb("data.mem",mm);  
	end

	assign readdata = mm[address];
	
/*	always @(*)
   begin
		case(MemRead)
			1'b1:
				assign readdata = mm[address];
		endcase
	end	*/

	always @(*)
   begin
		case(MemWrite)
			1'b1:
				begin
				#10
				mm[address] = writedata;
				#10
				$writememb("data.mem",mm);
				end
		endcase
	end


	
endmodule