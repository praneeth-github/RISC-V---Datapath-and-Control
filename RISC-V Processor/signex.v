module sign(
input[31:0] instruction,
output[63:0] seinst
);

//wire[11:0] inst;

wire [9:0] w1;

assign w1[0]=instruction[0];
assign w1[1]=instruction[1];
assign w1[2]=instruction[2];
assign w1[3]=instruction[3];
assign w1[4]=instruction[4];
assign w1[5]=instruction[5];
assign w1[6]=instruction[6];
assign w1[7]=instruction[12];
assign w1[8]=instruction[13];
assign w1[9]=instruction[14];

reg [11:0] inst1;
reg [31:0] inst2;
reg [63:0] tmp1;

always @(*)
   begin
		case(w1)
			10'b0000110011:
			begin
				 inst2 = {{20{instruction[31]}}, instruction[31:20]};
				 tmp1 = {{32{inst2[31]}}, inst2};
			end
			10'b0000010011:
			begin
				 inst2 = {{20{instruction[31]}}, instruction[31:20]};
				 tmp1 = {{32{inst2[31]}}, inst2};
			end
			10'b0110000011:
			begin
				 inst2 = {{20{instruction[31]}}, instruction[31:20]};
				 tmp1 = {{32{inst2[31]}}, inst2};
			end
			10'b0110100011:
			begin
				 inst1 = {instruction[31:25],instruction[11:7]};
				 tmp1 = {{52{instruction[31]}}, inst1};
			end
			10'b0001100011:
			begin
				 inst1 = {instruction[31:25],instruction[11:7]};
				 tmp1 = {{52{instruction[31]}}, inst1};
			end
		endcase
	end

assign seinst = tmp1;

//assign inst = {instruction[31:25],instruction[11:7]};
//assign seinst = {{52{instruction[31]}}, inst};


//assign inst = {{20{instruction[31]}}, instruction[31:20]};
//assign seinst = {{32{inst[31]}}, inst};

endmodule