`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2023 10:59:13
// Design Name: 
// Module Name: find_volume_level
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


module find_volume_level(input[31:0] peak_value, input clock_20kHz, output reg [3:0] volume_level = 0);

always @ (posedge clock_20kHz)
begin
    if (peak_value > 1999 && peak_value < 2150)
        begin
        volume_level <= 0;
        end
    if (peak_value > 2149 && peak_value < 2300)
        begin
        volume_level <= 4'd1;
        end
    if (peak_value > 2299 && peak_value < 2450)
        begin
        volume_level <= 4'd2;
        end
    if (peak_value > 2449 && peak_value < 2600)
        begin
        volume_level <= 4'd3;
        end
    if (peak_value > 2599 && peak_value < 2750) 
        begin
        volume_level <= 4'd4;
        end
    if (peak_value > 2749 && peak_value < 2900)
        begin
        volume_level <= 4'd5;
        end
    if (peak_value > 2899 && peak_value < 3050)
        begin
        volume_level <= 4'd6;
        end
    if (peak_value > 3049 && peak_value < 3200)
        begin
        volume_level <= 4'd7;
        end
    if (peak_value > 3199 && peak_value < 3350)
        begin
        volume_level <= 4'd8;
        end
    if (peak_value > 3349)
        begin
        volume_level <= 4'd9;
        end
end

endmodule
