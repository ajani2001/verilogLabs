`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2019 12:00:16
// Design Name: 
// Module Name: ModuleChain
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


module ModuleChain(
    input clock,
    output led[7:0]
);
    
    (* max_fanout = 2 *) (* dont_touch = "true" *) logic buff[7:0];
    genvar i;
    assign buff[0] = clock;
    for (i=0; i<8; i=i+1) begin
        assign buff[i+1] = buff[i];
        assign led[i] = buff[i]^clock;
    end
endmodule
