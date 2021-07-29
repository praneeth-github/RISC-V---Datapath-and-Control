`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:07:25 04/10/2021
// Design Name:   ALUCU
// Module Name:   C:/Users/PRANEETH G/Desktop/New folder (9)/qwedrftgh/dsfgng.v
// Project Name:  qwedrftgh
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUCU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dsfgng_v;

	// Inputs
	reg [1:0] aluop;
	reg [31:0] instruction;

	wire [3:0] op;

	// Instantiate the Unit Under Test (UUT)
	ALUCU uut (
		.aluop(aluop), 
		.instruction(instruction),
		.op(op)
	);

	initial begin
		// Initialize Inputs
		$monitor(".aluop:%b op:%b",aluop,op);
		aluop = 2'b10;
		instruction = 32'b00000000011100110000001010110011;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule