`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2019 09:31:39
// Design Name: 
// Module Name: seg7
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


module seg7(
    input logic [3:0] input4bit,
    output logic [7:0] output7seg
    );
    
    always_comb
    case(input4bit)
       0 : output7seg = 7'b00111111;
       1 : output7seg = 7'b00000110;
       2 : output7seg = 7'b01011011;
       3 : output7seg = 7'b01001111;
       4 : output7seg = 7'b01100110;
       5 : output7seg = 7'b01101101;
       6 : output7seg = 7'b01111101;
       7 : output7seg = 7'b00000111;
       8 : output7seg = 7'b01111111;
       9 : output7seg = 7'b01101111;
       default: output7seg = 7'b00000000;
   endcase
endmodule
