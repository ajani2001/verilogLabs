`timescale 1ns / 1ps

module Main(input clock, input resetBtn, output [7:0] output7seg0, output [7:0] output7seg1, output [7:0] output7seg2, output [7:0] output7seg3);
    reg [3:0] seg0 = 4'b0;
    reg [3:0] seg1 = 4'b0;
    reg [3:0] seg2 = 4'b0;
    reg [3:0] seg3 = 4'b0;
    reg [13:0] timeStorage = 14'b0;
    reg [24:0] tickStorage = 25'b0;
    always @(posedge clock) begin
        if(~resetBtn) begin
            seg0 <= 4'b0;
            seg1 <= 4'b0;
            seg2 <= 4'b0;
            seg3 <= 4'b0;
            timeStorage <= 14'b0;
            tickStorage <= 25'b0;
        end else begin
            if(tickStorage == 32767999) begin
                tickStorage <= 0;
                seg0 = seg0 == 9? 0 : seg0 + 1;
                seg1 = seg0 == 0? seg1 == 9? 0 : seg1 + 1 : seg1;
                seg2 = seg0 == 0 && seg1 == 0? seg2 == 9? 0 : seg2 + 1 : seg2;
                seg3 = seg0 == 0 && seg1 == 0 && seg2 == 0? seg3 == 9? 0 : seg3 + 1 : seg3;
            end else begin
                tickStorage <= tickStorage + 1;
            end
        end
    end
    seg7 seg0ctrl(.input4bit(seg0), .output7seg(output7seg0));
    seg7 seg1ctrl(.input4bit(seg1), .output7seg(output7seg1));
    seg7 seg2ctrl(.input4bit(seg2), .output7seg(output7seg2));
    seg7 seg3ctrl(.input4bit(seg3), .output7seg(output7seg3));
endmodule