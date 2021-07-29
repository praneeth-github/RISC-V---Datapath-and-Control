
module register(readreg1,readreg2,writereg,writedata,RegWrite,readdata1,readdata2);
	input [4:0] readreg1;
	input [4:0] readreg2;
	input [4:0] writereg;
	input [63:0] writedata;
	input RegWrite;
	output [63:0] readdata1;
	output [63:0] readdata2;
	
	reg [63:0] regis[0:31];
	
	initial
	begin
		
		$readmemb("reg.mem",regis);  
	end

	assign readdata1 = regis[readreg1];
	
	assign readdata2 = regis[readreg2];
	
	always @(*)
   begin
		case(RegWrite)
			1'b1:
				begin
				#10
				regis[writereg] = writedata;
				#10
				$writememb("reg.mem",regis);
				end
		endcase
	end
	

	
endmodule