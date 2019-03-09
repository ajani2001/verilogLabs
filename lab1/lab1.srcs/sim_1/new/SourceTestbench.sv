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
    logic toggle, light1, light2; 
    logic [7:0] lights;
    
    Source src(.l_door(ld),.r_door(rd),.lamp(lamp),.toggle(toggle),.light1(light1),.light2(light2),.lights(lights));
    
    initial begin
    $display("Running testbench");
    ld = 0;
    rd = 0; // Обе двери сначала закрыты
    toggle = 1;
    light1 = 1;
    light2 = 1;
    #50
    ld = 1; // Открыта левая дверь
    #20
    rd = 1; // Открыта правая дверь
    #50
    ld = 0; // Левую дверь закрыли
    #10
    rd = 0; // Правую дверь закрыли
    #20
    toggle = 0;
    #50
    toggle = 1;
    #50
    light1 = 0;
    #50
    light2 = 0;
    #50
    light1 = 1;
    #50
    light2 = 1;
    #50
    $finish;
    end
    
endmodule
