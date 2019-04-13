`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2019 11:04:38
// Design Name: 
// Module Name: freqDivider
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


module freqDivider(
    input logic inp,
    input logic reset,
    output logic out
    );
    reg state = 0;
    reg [24:0] counter = 0;
    assign out = state;
    always @(posedge inp) begin
        if(counter==32768000 || reset) begin
            counter <= 0;
            state <= !state & ~reset;
        end
        else
            counter = counter + 1;
    end
endmodule
