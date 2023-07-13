`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2023 15:44:36
// Design Name: 
// Module Name: Oled_Number_Display
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


module Oled_Switch_Number(input CLOCK, input [9:0] sw, output reg [5:0] six_side = 0, output reg [6:0] seg = 0);
    
    
    always @(posedge CLOCK) begin
        if (sw == 1) 
        begin
        six_side <= 6'b111111;
        seg <= 7'b1111110;
        end
        else if (sw == 10'b0000000010) 
        begin
        six_side <= 6'b101010;
        seg <= 7'b0110000;
        end
        else if (sw == 10'b0000000100) 
        begin
        six_side <= 6'b111111;
        seg <= 7'b1101101;
        end
        else if (sw == 10'b0000001000) 
        begin
        six_side <= 6'b111111;
        seg <= 7'b1111001;
        end
        else if (sw == 10'b0000010000) 
        begin
        six_side <= 6'b101111;
        seg <= 7'b0110011;
        end
        else if (sw == 10'b0000100000) 
        begin
        six_side <= 6'b111111;
        seg <= 7'b1011011;
        end
        else if (sw == 10'b0001000000) 
        begin
        six_side <= 6'b111111;
        seg <= 7'b1011111;
        end
        else if (sw == 10'b0010000000) 
        begin
        six_side <= 6'b101011;
        seg <= 7'b1110000;
        end
        else if (sw == 10'b0100000000) 
        begin
        six_side <= 6'b111111;
        seg <= 7'b1111111;
        end
        else if (sw == 10'b1000000000) 
        begin
        six_side <= 6'b111111;
        seg <= 7'b1111011;
        end
        else
        begin
        six_side <= 0;
        seg <= 0;
        end
    end
endmodule
