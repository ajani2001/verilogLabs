`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2019 11:32:46
// Design Name: 
// Module Name: Decoder3
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


module Decoder3(input [7:0] buttons, output logic [7:0] segDecoded);
   logic [7:0] buttonsInverted = ~buttons;
   
   logic [3:0]TMP11;
   logic [3:0]TMP12;
   logic [3:0]TMP13;
   logic [3:0]TMP14;
   logic [3:0]TMP21;
   logic [3:0]TMP22;
   logic [3:0]logicEncoded;
   sum4bit s11(.lvalue({3'b0,buttonsInverted[0]}), .rvalue({3'b0,buttonsInverted[1]}), .result(TMP11));
   sum4bit s12(.lvalue({3'b0,buttonsInverted[2]}), .rvalue({3'b0,buttonsInverted[3]}), .result(TMP12));
   sum4bit s13(.lvalue({3'b0,buttonsInverted[4]}), .rvalue({3'b0,buttonsInverted[5]}), .result(TMP13));
   sum4bit s14(.lvalue({3'b0,buttonsInverted[6]}), .rvalue({3'b0,buttonsInverted[7]}), .result(TMP14));
   sum4bit s21(.lvalue(TMP11), .rvalue(TMP12), .result(TMP21));
   sum4bit s22(.lvalue(TMP13), .rvalue(TMP14), .result(TMP22));
   sum4bit result(.lvalue(TMP21), .rvalue(TMP22), .result(logicEncoded));
   
   seg7 moduleseg7(.input4bit(logicEncoded), .output7seg(segDecoded));
endmodule
