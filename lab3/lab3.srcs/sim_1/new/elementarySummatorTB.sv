`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2019 11:33:58
// Design Name: 
// Module Name: elementarySummatorTB
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


module elementarySummatorTB();
    logic P,b1,b2,S,P1;
    elementarySummator DUT(.P(P),.b1(b1),.b2(b2),.S(S),.P1(P1));
    initial begin
    P=0;
    b1=0;
    b2=0;
    #50;
    b2=1;
    #50;
    b2=0;
    b1=1;
    #50;
    b2=1;
    #50;
    b1=0;
    b2=0;
    P=1;
    #50;
    b2=1;
    #50;
    b2=0;
    b1=1;
    #50;
    b2=1;
    #50;
    $finish;
    end;    
endmodule
