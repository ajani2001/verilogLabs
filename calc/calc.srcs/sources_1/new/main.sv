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

task pushNum(input [3:0] num, input reg [3:0] stackSize, inout reg [2:0] currentSize, output reg [15:0] stack [15:0]);
    if(currentSize!=4) begin
    case(currentSize)
    0: stack[stackSize][3:0] = num;
    1: stack[stackSize][7:4] = num;
    2: stack[stackSize][11:8] = num;
    3: stack[stackSize][15:12] = num;
    endcase
    currentSize = currentSize + 1;    
    end
endtask

function[15:0] sumDec(input[15:0] lvalue, rvalue, output overflow);
    reg[2:0] overflowCache = 3'b0;
    if(lvalue[3:0]+rvalue[3:0]>9) overflowCache[0] = 1;
    if(lvalue[7:4]+rvalue[7:4]+overflowCache[0]>9) overflowCache[1] = 1;
    if(lvalue[11:8]+rvalue[11:8]+overflowCache[1]>9) overflowCache[2] = 1;
    if(lvalue[15:12]+rvalue[15:12]+overflowCache[2]>9) overflow = 1;
    sumDec[3:0] = (lvalue[3:0]+rvalue[3:0])%10;
    sumDec[7:4] = (lvalue[7:4]+rvalue[7:4]+overflowCache[0])%10;
    sumDec[11:8] = (lvalue[11:8]+rvalue[11:8]+overflowCache[1])%10;
    sumDec[15:12] = (lvalue[15:12]+rvalue[15:12]+overflowCache[2])%10;    
endfunction

function[15:0] subtractDec(input[15:0] lvalue, rvalue, output overflow);
    reg[2:0] overflowCache = 3'b0;
    if(lvalue[3:0]<rvalue[3:0]) overflowCache[0] = 1;
    if(lvalue[7:4]<(rvalue[7:4]+overflowCache[0])) overflowCache[1] = 1;
    if(lvalue[11:8]<(rvalue[11:8]+overflowCache[1])) overflowCache[2] = 1;
    if(lvalue[15:12]<(rvalue[15:12]+overflowCache[2])) overflow = 1;
    subtractDec[3:0] = (10+lvalue[3:0]-rvalue[3:0])%10;
    subtractDec[7:4] = (10+lvalue[7:4]-rvalue[7:4]-overflowCache[0])%10;
    subtractDec[11:8] = (10+lvalue[11:8]-rvalue[11:8]-overflowCache[1])%10;
    subtractDec[15:12] = (10+lvalue[15:12]-rvalue[15:12]-overflowCache[2])%10;
endfunction

module main(input clock, input [3:0] kbdData, output logic [3:0] kbdCtrl, output [7:0] seg0, output [7:0] seg1, output [7:0] seg2, output [7:0] seg3);
    reg [15:0] stack [15:0];
    reg [3:0] stackSize = 4'b0;
    reg [1:0] currentSize = 2'b0;
    reg [15:0] kbdState = 16'b0;
    reg [15:0] kbdNewButton = 16'b0;
    reg [17:0] counter125hz = 18'b0;
    reg [1:0] rowIndex = 2'b0;
    reg [15:0] cache = 0;
    reg [2:0] actCode = 0;
    reg overflow = 0;
    reg [15:0] outputCache = 16'b0;
    seg7 s0(.input4bit(outputCache[3:0]), .output7seg(seg0));
    seg7 s1(.input4bit(outputCache[7:4]), .output7seg(seg1));
    seg7 s2(.input4bit(outputCache[11:8]), .output7seg(seg2));
    seg7 s3(.input4bit(outputCache[15:12]), .output7seg(seg3));
    always @(posedge clock) begin
        counter125hz <= counter125hz + 1;
        if(counter125hz[4:3]==2'b11 && actCode) begin
        case(actCode)
        1: begin
            if(stackSize!=0) begin
                stack[stackSize-1] = sumDec(.lvalue(stack[stackSize-1]), .rvalue(stack[stackSize]), .overflow(cache[0]));
                stack[stackSize] = 0;
                if(cache[0]==1) actCode = 6;
                else actCode = 0;
                cache[0]=0;
            end
            else actCode = 6;
        end
        2: begin
            if(stackSize!=0) begin
                stack[stackSize-1] = subtractDec(.lvalue(stack[stackSize-1]), .rvalue(stack[stackSize]), .overflow(cache[0]));
                stack[stackSize] = 0;
                stackSize = stackSize - 1;
                if(cache[0]==1) actCode = 6;
                else actCode = 0;
                cache[0]=0;
            end
            else actCode = 6;
        end
        3: begin
            if(stackSize!=0) begin
                if(stack[stackSize]!=0) begin
                    cache = sumDec(.lvalue(cache), .rvalue(stack[stackSize-1]), .overflow(overflow));
                    stack[stackSize] = stack[stackSize] - 1;
                    if(overflow==1) actCode = 6;
                end
                else begin
                    stack[stackSize-1] = cache;
                    cache = 0;
                    stackSize = stackSize - 1;
                    actCode = 0;
                end
            end
            else actCode = 6;
        end
        4: begin
            if(stackSize!=0 && stack[stackSize]!=0) begin
                if(stack[stackSize-1]>stack[stackSize]) begin
                    stack[stackSize-1] = subtractDec(.lvalue(stack[stackSize-1]), .rvalue(stack[stackSize]), .overflow(overflow));
                    cache = cache + 1;
                    if(overflow==1) actCode = 6;
                end
                else begin
                    stack[stackSize-1] = cache;
                    cache = 0;
                    stackSize = stackSize - 1;
                    actCode = 0;
                end
            end
            else actCode = 6;
        end
        5: begin
            stack[stackSize] = 0;
            actCode = 0;
        end
        7: begin
            stackSize = stackSize + 1;
            actCode = 0;
        end
        endcase
        end
        if(counter125hz == 18'b111111111111111111 && !actCode) begin
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
            pushNum(.num(4'b0001), .stackSize(stackSize), .currentSize(currentSize), .stack(stack));
        end
        16'b0000000000000010: begin
            pushNum(.num(4'b0010), .stackSize(stackSize), .currentSize(currentSize), .stack(stack));
        end
        16'b0000000000000100: begin
            pushNum(.num(4'b0011), .stackSize(stackSize), .currentSize(currentSize), .stack(stack));
        end
        16'b0000000000001000: begin
            actCode = 1;
        end
        16'b0000000000010000: begin
            pushNum(.num(4'b0100), .stackSize(stackSize), .currentSize(currentSize), .stack(stack));
        end
        16'b0000000000100000: begin
            pushNum(.num(4'b0101), .stackSize(stackSize), .currentSize(currentSize), .stack(stack));
        end
        16'b0000000001000000: begin
            pushNum(.num(4'b0110), .stackSize(stackSize), .currentSize(currentSize), .stack(stack));
        end
        16'b0000000010000000: begin
            actCode = 2;
        end
        16'b0000000100000000: begin
            pushNum(.num(4'b0111), .stackSize(stackSize), .currentSize(currentSize), .stack(stack));
        end
        16'b0000001000000000: begin
            pushNum(.num(4'b1000), .stackSize(stackSize), .currentSize(currentSize), .stack(stack));
        end
        16'b0000010000000000: begin
            pushNum(.num(4'b1001), .stackSize(stackSize), .currentSize(currentSize), .stack(stack));
        end
        16'b0000100000000000: begin
            actCode = 3;
        end
        16'b0001000000000000: begin
            actCode = 4;
        end
        16'b0010000000000000: begin
            pushNum(.num(4'b0000), .stackSize(stackSize), .currentSize(currentSize), .stack(stack));
        end
        16'b0100000000000000: begin
            actCode = 7;
        end
        16'b1000000000000000: begin
            actCode = 5;
        end
        endcase
        if(actCode == 0) begin
            outputCache[3:0] = stack[stackSize][3:0];
            outputCache[7:4] = stack[stackSize][7:4];
            outputCache[11:8] = stack[stackSize][11:8];
            outputCache[15:12] = stack[stackSize][15:12];
        end
        kbdNewButton = 16'b0;
    end
endmodule
