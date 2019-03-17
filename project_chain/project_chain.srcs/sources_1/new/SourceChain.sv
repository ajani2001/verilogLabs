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
module coolRepeater(input in, output out);
    (* dont_touch = "true" *)
    logic [2:0]inv;
    assign inv[0] = ~in;
    assign inv[1] = ~inv[0];
    assign inv[2] = ~inv[1];
    assign out = ~inv[2];
endmodule

module ModuleChain(input clock, output [7:0] led);    
    (* max_fanout = 2 *) (* dont_touch = "true" *) logic buff[7:0];
    
    genvar i;
    coolRepeater rep0(.in(clock), .out(buff[0]));
    for (i=0; i<7; i=i+1) begin
        coolRepeater rep(.in(buff[i]), .out(buff[i+1]));
        assign led[i] = buff[i]^clock;
    end
    assign led[7] = buff[7]^clock;
endmodule
