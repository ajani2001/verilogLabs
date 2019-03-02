`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2019 12:07:17
// Design Name: 
// Module Name: SourceTestbench
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


module SourceTestbench(
    );
    logic ld, rd, lamp;
    Source src(ld,rd,lamp);
    
    initial begin
    $display("Running testbench");
    ld = 0;
    rd = 0; // Обе двери сначала закрыты
    #5 // Задержка в 5 единиц времени
    ld = 1; // Открыта левая дверь
    #2
    rd = 1; // Открыта правая дверь
    #5
    ld = 0; // Левую дверь закрыли
    #1
    rd = 0; // Правую дверь закрыли
    #2
    $finish;
    end
    
endmodule
