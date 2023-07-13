`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2023 14:45:27
// Design Name: 
// Module Name: Seven_Seg_Display
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


module Group_seven_seg_individual(input CLOCK, input[8:0] x,y, output reg [15:0] oled_data, input[5:0]six_side, input[6:0]seg, output reg [9:0] number = 0, output reg flag = 0);

always @(posedge CLOCK) begin

//num0
if (six_side == 6'b111111 && seg == 7'b1111110) begin
flag <= 1;
number <= 10'b0000000001;
end
//num1
else if (six_side == 6'b101010 && seg == 7'b0110000) begin
flag <= 1;
number <= 10'b0000000010;
end
//num2
else if (six_side == 6'b111111 && seg == 7'b1101101) begin
flag <= 1;
number <= 10'b0000000100;
end
//num3
else if (six_side == 6'b111111 && seg == 7'b1111001) begin
flag <= 1;
number <= 10'b0000001000;
end
//num4
else if (six_side == 6'b101111 && seg == 7'b0110011) begin
flag <= 1;
number <= 10'b0000010000;
end
//num5
else if (six_side == 6'b111111 && seg == 7'b1011011) begin
flag <= 1;
number <= 10'b0000100000;
end
//num6
else if (six_side == 6'b111111 && seg == 7'b1011111) begin
flag <= 1;
number <= 10'b0001000000;
end
//num7
else if (six_side == 6'b101011 && seg == 7'b1110000) begin
flag <= 1;
number <= 10'b0010000000;
end
//num8
else if (six_side == 6'b111111 && seg == 7'b1111111) begin
flag <= 1;
number <= 10'b0100000000;
end
//num9
else if (six_side == 6'b111111 && seg == 7'b1111011) begin
flag <= 1;
number <= 10'b1000000000;
end
//no flag
else if (six_side == 6'b111111 && seg == 7'b1111011) begin
flag <= 0;
number <= 0;
end



//Topleft
if (x >= 14 && x <= 18 && y >= 8 && y <= 12 && six_side[0])
begin
oled_data <= 16'hFFFF;
end
//Topright
else if (x >= 38 && x <= 42 && y >= 8 && y <= 12 && six_side[1])
begin
oled_data <=16'hFFFF;
end
//Midleft
else if (x >= 14 && x <= 18 && y >= 26 && y <= 30 && six_side[2])
begin
oled_data <=16'hFFFF;
end
//Midright
else if (x >= 38 && x <= 42 && y >= 26 && y <= 30 && six_side[3])
begin
oled_data <=16'hFFFF;
end
//Botleft
else if (x >= 14 && x <= 18 && y >= 44 && y <= 48 && six_side[4])
begin
oled_data <=16'hFFFF;
end
//Botright
else if (x >= 38 && x <= 42 && y >= 44 && y <= 48 && six_side[5])
begin
oled_data <=16'hFFFF;
end
//sega
else if (x >= 19 && x <= 37 && y >= 8 && y <= 12 && seg[6])
begin
oled_data <=16'hFFFF;
end
//segb
else if (x >= 38 && x <= 42 && y >= 13 && y <= 25 && seg[5])
begin
oled_data <=16'hFFFF;
end
//segc
else if (x >= 38 && x <= 42 && y >= 31 && y <= 43 && seg[4])
begin
oled_data <=16'hFFFF;
end
//segd
else if (x >= 19 && x <= 37 && y >= 44 && y <= 48 && seg[3])
begin
oled_data <=16'hFFFF;
end
//sege
else if (x >= 14 && x <= 18 && y >= 31 && y <= 43 && seg[2])
begin
oled_data <=16'hFFFF;
end
//segf
else if (x >= 14 && x <= 18 && y >= 13 && y <= 25 && seg[1])
begin
oled_data <=16'hFFFF;
end
//segg
else if (x >= 19 && x <= 37 && y >= 26 && y <= 30 && seg[0])
begin
oled_data <=16'hFFFF;
end
//Borders
//else if ((x == 14 || x == 18 || x == 38 ||  x == 42) && y >= 8 && y <= 48)
//begin
//oled_data <= 16'hFFFF;
//end
//else if ((y == 8 || y == 12 || y == 26 || y == 30 || y == 44 || y == 48) && x >= 14 && x <= 42)
//begin
//oled_data <= 16'hFFFF;
//end
//Everything Else Black Screen
else
begin
oled_data <= 0;
end
end
endmodule

