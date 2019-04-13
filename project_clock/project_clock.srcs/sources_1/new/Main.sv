`timescale 1ns / 1ps

module Main(input clock, input resetBtn, output [7:0] output7seg);
    reg [13:0] timeStorage = 14'b0;
    reg newClock;
    freqDivider FD(.inp(clock), .reset(~resetBtn), .out(newClock));
    always @(posedge newClock, ~resetBtn) begin
        timeStorage <= ~resetBtn ? 0 : (timeStorage == 9999 ? 0 : timeStorage + 1);
    end
    seg7 dummy(.input4bit({timeStorage[3], timeStorage[2], timeStorage[1], timeStorage[0]}), .output7seg(output7seg));
endmodule