`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2019 12:15:50
// Design Name: 
// Module Name: TB
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


module TB();
    logic clock;
    logic [7:0]led;
    
    ModuleChain test(.clock(clock),.led(led));
    initial begin
    $display("running TB");
    clock=0;
    #100
    clock=1;
    #100
    clock=0;
    #100
    $finish;
    end
endmodule
