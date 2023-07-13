`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2023 14:56:47
// Design Name: 
// Module Name: Oled_Pixel
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


module Pixel_toXY(
    input[12:0] index, 
    output[8:0] x,y
    );
    
    assign x = index % 96;
    assign y = index / 96;
    
endmodule

