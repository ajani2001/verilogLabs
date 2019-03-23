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


module Decoder3(input [2:0] dataEncoded, output logic [7:0] dataDecoded, output logic [7:0] segDecoded);

   logic [2:0] logicEncoded = ~dataEncoded;

   genvar i;
   for (i=0; i < 8; i=i+1)
   begin
      assign dataDecoded[i] = (logicEncoded == i);
   end
   
   always_comb
   case(logicEncoded)
      1'd0 : assign segDecoded = 7'b00111111;
      1'd1 : assign segDecoded = 7'b00000110;
      1'd2 : assign segDecoded = 7'b01011011;
      1'd3 : assign segDecoded = 7'b00111111;
      1'd4 : segDecoded = 7'b00111111;
      1'd5 : segDecoded = 7'b00111111;
      1'd6 : segDecoded = 7'b00111111;
      1'd7 : segDecoded = 7'b00111111;
      1'd8 : segDecoded = 7'b00111111;
      1'd9 : segDecoded = 7'b00111111;
   endcase
   /*
   assign segDecoded[0] = (logicEncoded == 0 || logicEncoded == 2 || logicEncoded == 3 || logicEncoded == 5 || logicEncoded == 6 || logicEncoded == 7);
   assign segDecoded[1] = (logicEncoded == 0 || logicEncoded == 1 || logicEncoded == 2 || logicEncoded == 3 || logicEncoded == 4 || logicEncoded == 7);
   assign segDecoded[2] = (logicEncoded == 0 || logicEncoded == 1 || logicEncoded == 3 || logicEncoded == 4 || logicEncoded == 5 || logicEncoded == 6 || logicEncoded == 7);
   assign segDecoded[3] = (logicEncoded == 0 || logicEncoded == 2 || logicEncoded == 3 || logicEncoded == 5 || logicEncoded == 6);
   assign segDecoded[4] = (logicEncoded == 0 || logicEncoded == 2 || logicEncoded == 6);
   assign segDecoded[5] = (logicEncoded == 0 || logicEncoded == 4 || logicEncoded == 5 || logicEncoded == 6);
   assign segDecoded[6] = (logicEncoded == 2 || logicEncoded == 3 || logicEncoded == 4 || logicEncoded == 5 || logicEncoded == 6);
   assign segDecoded[7] = 0;
   */
endmodule
