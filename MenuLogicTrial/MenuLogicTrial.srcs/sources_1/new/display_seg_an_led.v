`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2023 20:44:15
// Design Name: 
// Module Name: display_seg
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


module display_seg_an_led(input [3:0] volume_level, input clock_20kHz, 
output reg [7:0]seg, output reg [3:0]an, output reg [8:0]led_display);

always @(posedge clock_20kHz)
begin
    if (volume_level == 4'd0) 
        begin
        an <= 4'b1110;
        seg <= 8'b11000000;
        led_display <= 0;
        end
    if (volume_level == 4'd1)
        begin
        an <= 4'b1110;
        seg <= 8'b11111001;
        led_display <= 9'b000000001;
        end
    if (volume_level == 4'd2)  
        begin
        an <= 4'b1110;
        seg <= 8'b10100100;
        led_display <= 9'b000000011;
        end
    if (volume_level == 4'd3)
        begin
        an <= 4'b1110;
        seg <= 8'b10110000;
        led_display <= 9'b000000111;
        end
    if (volume_level == 4'd4)
        begin
        an <= 4'b1110;
        seg <= 8'b10011001;
        led_display <= 9'b000001111;
        end
    if (volume_level == 4'd5) 
        begin
        an <= 4'b1110;
        seg <= 8'b10010010;
        led_display <= 9'b000011111;
        end
    if (volume_level == 4'd6)
        begin
        an <= 4'b1110;
        seg <= 8'b10000010;
        led_display <= 9'b000111111;
        end
    if (volume_level == 4'd7)
        begin
        an <= 4'b1110;
        seg <= 8'b11111000;
        led_display <= 9'b001111111;
        end
    if (volume_level == 4'd8)
        begin
        an <= 4'b1110;
        seg <= 8'b10000000;
        led_display <= 9'b011111111;
        end
    if (volume_level == 4'd9)
        begin
        an <= 4'b1110;
        seg <= 8'b10010000;
        led_display <= 9'b111111111;
        end    
end

endmodule
