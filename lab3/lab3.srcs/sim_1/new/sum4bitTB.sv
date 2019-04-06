`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2019 12:22:06
// Design Name: 
// Module Name: sum4bitTB
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


module sum4bitTB(

    );
    logic[3:0] lvalue;
    logic[3:0] rvalue;
    logic[3:0] result;
    sum4bit DUT(.lvalue(lvalue),.rvalue(rvalue),.result(result));
    initial begin
    lvalue=4'b0;
    rvalue=4'b0;
    #50
    lvalue = lvalue+1;
    #50
    lvalue = lvalue+1;
    #50
    rvalue = rvalue+1;
    #50
    rvalue = rvalue+1;
    #50
    rvalue = rvalue+1;
    #50
    lvalue = lvalue+1;
    #50
    lvalue = lvalue+1;
    #50
    lvalue = lvalue+1;
    #50
    rvalue = rvalue+1;
    #50
    rvalue = rvalue+1;
    #50
    rvalue = rvalue+1;
    #50
    rvalue = rvalue+1;
    #50
    lvalue = lvalue+1;
    #50
    lvalue = lvalue+1;
    #50
    lvalue = lvalue+1;
    #50
    lvalue = lvalue+1;
    #50
    $finish;
    end
endmodule
