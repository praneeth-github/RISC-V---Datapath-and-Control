module tb_v;

	// Inputs
	reg clk,reset;
	wire [63:0] pc_next;
	reg [63:0] pc;

	// Outputs

	// Instantiate the Unit Under Test (UUT)
	main_main uut (
		.clk(clk),
		.reset(reset),
		.pc_next(pc_next),
		.pc(pc)
	);



	initial begin

		// Initialize Inputs
		$dumpfile("example.vcd");
		$dumpvars(0,tb_v);
		$display("\nRISC V instructions:\naddi x5,x0,0\naddi x10,x0,5\naddi x11,x0,10\nld x6,0(x5)\nld x7,0(x10)\nadd x8,x6,x7\nsd x8,0(x11)");
		$monitor($time, ".pc:%b pc_next:%b" ,pc,pc_next);
		clk=1;
		reset=0;
		pc=4;                		
		
		// Wait 100 ns for global reset to finish
		#1300 $finish;		 

	end
	always begin
	#100 clk=~clk;
	#100 clk=~clk;
	$monitor($time, ".pc:%b pc_next:%b" ,pc,pc_next);
	reset=0;
	pc=pc_next;
	end
      
endmodule