module UnidadeDeControle(status,clk,Opcode,tula,Tx,Ty,Tz);
	
	input wire clk;
	input wire [2:00] Opcode;
	output reg [2:00] Tx,Ty,Tz,tula;
	
	parameter RESET = 3'b000;
	parameter LOAD = 3'b001;
	parameter HOLD = 3'b010;
	parameter SHIFTR = 3'b011;
	
	 always @ (posedge clk) begin
		case (Opcode)
			3'b001: begin // CLDRD
				Ty = RESET;
				Tx = LOAD;
				Tz = RESET;
				tula = RESET;
				end
			3'b010: begin // ADDLD
				Ty = LOAD;
				Tx = LOAD;
				Tz = HOLD;
				tula = RESET;
				end
			3'b011: begin // ADD
				Ty = HOLD;
				Tx = HOLD;
				Tz = HOLD;
				tula = RESET;
				end
			3'b100: begin // DIV2
				Ty = SHIFTR;
				Tx = HOLD;
				Tz = HOLD;
				tula = RESET;
				end
			3'b101 : begin // DISPLAY 
				Ty = HOLD;
				Tx = HOLD;
				Tz = LOAD;
				tula = RESET;
				end
			endcase
		end
endmodule