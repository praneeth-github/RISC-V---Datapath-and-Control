`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:55:05 04/10/2021
// Design Name:   Control
// Module Name:   C:/Users/PRANEETH G/Desktop/New folder (9)/qwedrftgh/sdgfh.v
// Project Name:  qwedrftgh
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sdgfh_v;

	// Inputs
	reg [31:0] instruction;

	// Outputs
	wire Branch;
	wire MemRead;
	wire MemtoReg;
	wire [1:0] ALUOp;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.instruction(instruction), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.ALUOp(ALUOp), 
		.MemWrite(MemWrite), 
		.ALUSrc(ALUSrc), 
		.RegWrite(RegWrite)
	);

	initial begin
		// Initialize Inputs
		$monitor($time, "MemRead:%b MemtoReg:%b ALUOp:%b ALUSrc:%b RegWrite:%b MemWrite:%b",MemRead,MemtoReg,ALUOp,ALUSrc,RegWrite,MemWrite);
		instruction = 00000000011100110000001010110011;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule