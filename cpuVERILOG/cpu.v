module cpu(clk,Opcode,count,in,outx,outy,out,outula,status,tula,Tx,Ty,Tz);
	//Escolhemos a opera��o (a+b)/2.
    input wire clk;
    output wire[3:0] in;
    output wire[3:0] outx,outy,out,outula;
    output wire[2:0] tula,Tx,Ty,Tz,Opcode;
    output wire status;
    output reg[3:0] count;
    
	initial begin
		count = 4'd0;
		end
	
	always @(posedge clk) begin
			if (count == 4'd5)
				count = 4'd0;
			else
				count = (count + 1);
		end
	memory memoria(Opcode, count, in);
	UnidadeDeControle controle(status,clk,Opcode,tula,Tx,Ty,Tz);
	RegistratorX regx(Tx, in, clk, outx);
    RegistratorY regy(Ty, outula, clk, outy);
    ula ulaula(outx,outy,tula,outula,status);
    RegistratorZ regz(Tz, outy, clk, out);
    
endmodule