module Overflow(Cin,Cout,Ovf);
	input Cin,Cout;
	output Ovf;
	
	assign Ovf = (~Cin & Cout) | (Cin & ~Cout);


endmodule
