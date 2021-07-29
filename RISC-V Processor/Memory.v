module Memory(instruction, pc);

    input [63:0] pc;
    output reg [31:0] instruction;
	
    reg [31:0] instructions[0:19];  
    initial begin 
        $readmemb("memory.mem", instructions); 
    end
	
    always @(*) begin
        instruction = instructions[pc>>2];
    end

endmodule