`timescale 1ns / 1ps

module tb_v;

	// Inputs
	reg clk;
	reg reset;
	reg [63:0] pc;

	// Outputs
	wire [63:0] pc_next;
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	IF uut (
		.clk(clk), 
		.reset(reset), 
		.pc_next(pc_next), 
		.pc(pc), 
		.instruction(instruction)
	);

	initial begin
		// Initialize Inputs
		$monitor($time, ".clk:%b pc:%b inst:%b pc_next:%b" ,clk,pc,instruction,pc_next);
		clk = 1;
		reset = 0;
		pc = 2;

		// Wait 100 ns for global reset to finish
		#100;
		pc = pc_next;
		$monitor($time, ".clk:%b pc:%b inst:%b pc_next:%b" ,clk,pc,instruction,pc_next);
		clk = 1;
		reset = 0;
		#100;
		pc = pc_next;
		$monitor($time, ".clk:%b pc:%b inst:%b pc_next:%b" ,clk,pc,instruction,pc_next);
		clk = 0;
		reset = 0;
		#100;
		pc = pc_next;
		$monitor($time, ".clk:%b pc:%b inst:%b pc_next:%b" ,clk,pc,instruction,pc_next);
		clk = 1;
		reset = 0;
		#100;
        
		// Add stimulus here

	end
      
endmodule