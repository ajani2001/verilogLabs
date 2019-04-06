`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2019 12:10:15
// Design Name: 
// Module Name: sum4bit
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


module sum4bit(
    input [3:0] lvalue,
    input [3:0] rvalue,
    output [3:0] result
    );
    logic [3:0] P;
    assign P[0]=1'b0;
    elementarySummator iSum0(.P(1'b0), .b1(lvalue[0]), .b2(rvalue[0]), .P1(P[1]), .S(result[0]));
    elementarySummator iSum1(.P(P[1]), .b1(lvalue[1]), .b2(rvalue[1]), .P1(P[2]), .S(result[1]));
    elementarySummator iSum2(.P(P[2]), .b1(lvalue[2]), .b2(rvalue[2]), .P1(P[3]), .S(result[2]));
    elementarySummator iSum3(.P(P[3]), .b1(lvalue[3]), .b2(rvalue[3]), .S(result[3]));
endmodule
