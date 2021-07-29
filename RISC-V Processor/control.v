module Control(
	input [31:0] instruction,
	output Branch,
	output MemRead,
	output MemtoReg,
	output [1:0] ALUOp,
	output MemWrite,
	output ALUSrc,
	output RegWrite
	);
	
	wire [2:0] opcode;

	wire Branch1,MemRead1,MemtoReg1;
	wire [1:0] ALUOp1;
	wire MemWrite1,ALUSrc1,RegWrite1;

	assign opcode = instruction[6:4];
	
	wire w1,w2,w3,w4;
	
	assign w1 = ~opcode[2];
	assign w2 = ~opcode[1];
	assign w3 = ~opcode[0];

	AND and10(w1,w2,w4);
	AND and11(w4,w3,MemtoReg1);

	AND and12(w1,w3,ALUSrc1);
	
	assign MemRead1 = MemtoReg1;

	wire w5,w6,w7;

	AND and13(opcode[1],opcode[0],w5);
	AND and14(w2,w3,w6);
	OR or10(w5,w6,w7);
	AND and15(w1,w7,RegWrite1);

	wire w8;

	AND and16(opcode[2],opcode[1],w8);
	AND and17(w8,w3,Branch1);

	wire w9,w10;

	AND and18(w1,opcode[1],w9);
	AND and19(w9,w3,MemWrite1);

	assign ALUOp1[0] = Branch1;

	AND and20(opcode[1],opcode[0],w10);
	AND and21(w1,w10,ALUOp1[1]);

	reg Branch2,MemRead2,MemtoReg2;
	reg [1:0] ALUOp2;
	reg MemWrite2,ALUSrc2,RegWrite2;

	always @(*)
   	begin
		case(opcode)
			3'b001:
			begin
				 Branch2=0;
				 MemRead2=0;
				 MemtoReg2=0;
				 ALUOp2=2'b10;
				 MemWrite2=0;
				 ALUSrc2=1;
				 RegWrite2=1;
			end
			default:
			begin
				 Branch2=Branch1;
				 MemRead2=MemRead1;
				 MemtoReg2=MemRead1;
				 ALUOp2=ALUOp1;
				 MemWrite2=MemWrite1;
				 ALUSrc2=ALUSrc1;
				 RegWrite2=RegWrite1;
			end
		endcase
	end

assign Branch=Branch2;
assign MemRead=MemRead2;
assign MemtoReg=MemRead2;
assign ALUOp=ALUOp2;
assign MemWrite=MemWrite2;
assign ALUSrc=ALUSrc2;
assign RegWrite=RegWrite2;


endmodule