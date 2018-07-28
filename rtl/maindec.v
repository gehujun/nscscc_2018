`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 15:21:30
// Design Name: 
// Module Name: maindec
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module maindec(
	input wire[5:0] op,

	output wire memtoreg,memwrite,
	output wire branch,alusrc,
	output wire regdst,regwrite,
	output wire jump,
	output wire[1:0] aluop
    );
	reg[8:0] controls;
	assign {regwrite,regdst,alusrc,branch,memwrite,memtoreg,jump,aluop} = controls;
	always @(*) begin
		case (op)
			`R_TYPE:controls <= {12'b1100000_00000,`R_TYPE_OP};//R-TYRE
			`LW:controls <= 12'b1010010_00000_;//LW
			`SW:controls <= 12'b0010100_00000;//SW
			`BEQ:controls <= 12'b0001000_00000;//BEQ
			`ADDI:controls <= 12'b1010000_00000;//ADDI
			`J:controls <= 12'b0000001_00000;//J
			default:  controls <= 9'b000000000;//illegal op
		endcase
	end
endmodule
