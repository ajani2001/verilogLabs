`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2019 11:29:01
// Design Name: 
// Module Name: elementarySummator
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


module elementarySummator(
    input P,
    input b1,
    input b2,
    output S,
    output P1
    );
    always_comb;
    assign S = b1^b2^P;
    assign P1 = (b1&b2)|(P&(b1^b2));
endmodule
