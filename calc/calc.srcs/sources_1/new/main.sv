`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2019 10:58:49
// Design Name: 
// Module Name: main
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

function reg [15:0] getNewButton(input[15:0]kbdState, input[1:0]rowIndex, input[3:0]kbdData);
    
endfunction

module main(input clock, input [3:0] kbdData, output logic [3:0] kbdCtrl, output [7:0] seg0, output [7:0] seg1, output [7:0] seg2, output [7:0] seg3);
    reg [255:0] stack = 255'b0;
    reg stackSize = 0;
    reg currentSize = 0;
    reg [15:0] kbdState = 16'b0;
    reg [15:0] kbdNewButton = 16'b0;
    reg [17:0] counter125hz = 18'b0;
    reg [1:0] rowIndex = 2'b0;
    assign kbdCtrl = 4'b1ZZZ;
    always @(posedge clock) begin
        counter125hz <= counter125hz + 1;
        if(counter125hz == 18'b11111111111111111) begin
            case(rowIndex)
            0: begin
                kbdNewButton[15:12] = kbdData ^ kbdState[15:12];
                kbdState[15:12] = kbdData;
                kbdCtrl = 4'bZZZ1;
            end
            1: begin
                kbdNewButton[3:0] = kbdData ^ kbdState[3:0];
                kbdState[3:0] = kbdData;
                kbdCtrl = 4'bZZ1Z;
            end
            2: begin
                kbdNewButton[7:4] = kbdData ^ kbdState[7:4];
                kbdState[7:4] = kbdData;
                kbdCtrl = 4'bZ1ZZ;
            end
            3: begin
                kbdNewButton[11:8] = kbdData ^ kbdState[11:8];
                kbdState[11:8] = kbdData;
                kbdCtrl = 4'b1ZZZ;
            end
            endcase
        end
        case(kbdNewButton)
        16'b0000000000000001: begin
        end
        16'b0000000000000010: begin
        end
        16'b0000000000000100: begin
        end
        16'b0000000000001000: begin
        end
        16'b0000000000010000: begin
        end
        16'b0000000000100000: begin
        end
        16'b0000000001000000: begin
        end
        16'b0000000010000000: begin
        end
        16'b0000000100000000: begin
        end
        16'b0000001000000000: begin
        end
        16'b0000010000000000: begin
        end
        16'b0000100000000000: begin
        end
        16'b0001000000000000: begin
        end
        16'b0010000000000000: begin
        end
        16'b0100000000000000: begin
        end
        16'b1000000000000000: begin
        end
        endcase
        kbdNewButton = 16'b0;
    end
endmodule
