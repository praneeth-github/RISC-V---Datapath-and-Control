module ALUCU(
	input [1:0] aluop,
	input [31:0] instruction,
	output [3:0] op
	);
	
	wire [5:0] f;

	assign f[0] = instruction[25];
	assign f[1] = instruction[26];
	assign f[2] = instruction[27];
	assign f[3] = instruction[28];
	assign f[4] = instruction[29];
	assign f[5] = instruction[31];


	wire w1,w2,w3,w4,w5;
	
	OR or2(f[3],f[0],w1);
	AND and2(aluop[1],w1,op[0]);

	assign w2=~f[2];
	assign w3=~aluop[1];

	OR or3(w2,w3,op[1]);
	AND and3(aluop[1],f[1],w4);
	OR or4(aluop[0],w4,op[2]);

	assign w5=~aluop[0];
	AND and4(aluop[0],w5,op[3]);
	


endmodule