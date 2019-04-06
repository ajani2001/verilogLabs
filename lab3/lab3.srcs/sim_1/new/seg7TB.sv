`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2019 09:38:41
// Design Name: 
// Module Name: seg7TB
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


module seg7TB();
    logic [3:0] input4bit;
    logic [7:0] output7seg;
    seg7 TESTMODULE(.input4bit(input4bit), .output7seg(output7seg));
    genvar i;
    initial begin
    input4bit = 4'b0;
    #50;
    input4bit = input4bit+1;
        #50;
    input4bit = input4bit+1;
        #50;
    input4bit = input4bit+1;
        #50;
    input4bit = input4bit+1;
        #50;
    input4bit = input4bit+1;
        #50;
    input4bit = input4bit+1;
        #50;
    input4bit = input4bit+1;
        #50;
    input4bit = input4bit+1;
        #50;
    input4bit = input4bit+1;
        #50;
    input4bit = input4bit+1;
        #50;
    input4bit = input4bit+1;
        #50;
    input4bit = input4bit+1;
        #50;
    input4bit = input4bit+1;
    #50;
    $finish;
    end
endmodule
