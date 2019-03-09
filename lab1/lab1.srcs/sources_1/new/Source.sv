`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2019 11:57:44
// Design Name: 
// Module Name: Source
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


module Source(
    input l_door,
    input r_door,
    output lamp,
    
    input toggle,
    input light1,
    input light2,
    output lights[7:0]
    );
    
    assign lights[0] = ~toggle | ~light2;
    assign lights[1] = ~toggle | ~light2;
    assign lights[2] = ~toggle | ~light1 | ~light2;
    assign lights[3] = 0;
    assign lights[4] = 0;
    assign lights[5] = ~toggle | ~light1 | ~light2;
    assign lights[6] = ~toggle | ~light2;
    assign lights[7] = ~toggle | ~light2;
    assign  lamp = ~l_door | ~r_door;
    
endmodule
