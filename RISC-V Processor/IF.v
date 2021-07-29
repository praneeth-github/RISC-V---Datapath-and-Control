module main_main(clk,reset,pc_next,pc);
	input clk,reset;
	output [63:0] pc_next;
	input [63:0] pc;
	wire RegWrite;
	wire ALUSrc;
	wire Branch;
	wire [1:0] ALUop;
	wire MemWrite;
	wire MemRead;
	wire MemtoReg;

        wire [63:0] mid;
	wire [31:0] instruction;

        Memory m11(instruction,pc);
        PC p1(clk,reset,pc,mid);

	wire [63:0] pc_next1;
	assign pc_next1 = mid+4;   
	
	wire [4:0] rs1;
	wire [4:0] rs2;
	wire [4:0] rd;
	
	assign rs1 = instruction[19:15];
	assign rs2 = instruction[24:20];
	assign rd = instruction [11:7];

	wire [63:0] writedata;
	wire [63:0] readdata1;
	wire [63:0] readdata2;
	wire [63:0] immed;

	Control c1(instruction,Branch,MemRead,MemtoReg,ALUop,MemWrite,ALUSrc,RegWrite);

	
	
	
	
	register reg1(rs1,rs2,rd,writedata,RegWrite,readdata1,readdata2);
	
	sign sign1(instruction,immed);
	
	wire [63:0] immed_1;
	assign immed_1 = immed<<1;

	wire [3:0] abc;
	assign abc = 4'b0010;

	wire [63:0] pcpc;
	wire ovf1,zero1;
	ALU alu2(pc,immed_1,abc,pcpc,ovf1,zero1);

	
	
	wire [63:0] input2;
	MUX_ALUSrc muxalusrc(readdata2,immed,ALUSrc,input2);

	wire [63:0] out;
	wire ovf,zero;
	wire [63:0] readdata;
	wire [3:0] alu;
	ALUCU alucu1(ALUop,instruction,alu);
	ALU alu64(readdata1,input2,alu,out,ovf,zero);
	wire Zero1;
	AND and1(zero,Branch,Zero1);
	


	MUX_Zero muxzero1111(pc_next1,pcpc,Zero1,pc_next);

	datamem data11(out,readdata2,MemWrite,MemRead,readdata);

	MUX_MemtoReg muxmemtoreg(readdata,out,MemtoReg,writedata);
                
endmodule