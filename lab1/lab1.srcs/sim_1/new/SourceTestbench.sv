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
    logic toggle, light1, light2, lights[7:0];
    Source src(ld,rd,lamp,
    toggle, light1, light2, lights);
    
    initial begin
    $display("Running testbench");
    ld = 0;
    rd = 0; // Обе двери сначала закрыты
    toggle = 1;
    light1 = 1;
    light2 = 1;
    #5 // Задержка в 5 единиц времени
    ld = 1; // Открыта левая дверь
    #2
    rd = 1; // Открыта правая дверь
    #5
    ld = 0; // Левую дверь закрыли
    #1
    rd = 0; // Правую дверь закрыли
    #2
    toggle = 0;
    #5
    toggle = 1;
    #5
    light1 = 0;
    #5
    light2 = 0;
    #5
    light1 = 1;
    #5
    light2 = 1;
    #5
    $finish;
    end
    
endmodule
