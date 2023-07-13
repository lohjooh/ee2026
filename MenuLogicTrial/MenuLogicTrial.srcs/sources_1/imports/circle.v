`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2023 22:45:45
// Design Name: 
// Module Name: circle
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


module circle(input CLOCK,input[8:0]x,y, output reg [15:0] oled_pixel = 0, input[1:0]reset, output reg [8:0] counter = 0, input [3:0]sw, //inout ps2_clk, ps2_data,
input left, right, middle, input [11:0] xpos,ypos, input isangry);

wire onehz;
wire fasthz;
my_clk_divider onehzclock(CLOCK, onehz, 49999999);
my_clk_divider fasthzclock(CLOCK, fasthz, 2499999);
reg swap = 0;
reg[8:0]cx = 44;
reg[8:0]cy = 36;
reg[16:0]withindistance = 0;
reg[16:0]currentdistance = 0;
//reg[8:0] counter;
reg[16:0]xdist;
reg[16:0]ydist;
reg[5:0] newred = 0;
reg[5:0] newblue = 0;
reg [6:0] newgreen = 0;
reg [15:0] newoled = 0;
reg [8:0] red = 255;
reg [8:0] blue = 255;
reg [8:0] green = 255;
reg newswap = 0;
//reg [11:0] value = 94; reg setmax_x = 1; reg setmax_y = 1; reg middle_pressed = 0;
//wire [11:0]xpos; wire [11:0]ypos; reg [11:0]ypos_adjusted;
//wire left, right, middle;
//MouseCtl mouse(.clk(CLOCK), //.rst(RESET), 
//    .value(value[11:0]),// .setx(setx), .sety(sety), 
//    .setmax_x(setmax_x), .setmax_y(setmax_y),
//    .xpos(xpos[11:0]), .ypos(ypos[11:0]),// .zpos(zpos[3:0]), 
//    .left(left), .middle(middle), .right(right), //.new_event(new_event), 
//    .ps2_clk(ps2_clk), .ps2_data(ps2_data)
//    );
wire click;
reg lastclick = 0;
reg [8:0] clickcounter = 0;
reg toggle = 0;
real radius;
wire twentyfivemhz;
my_clk_divider slow(CLOCK, twentyfivemhz, 1); 
always@(posedge twentyfivemhz) begin
newred <= (red >> 3);
newblue <= (blue >> 3);
newgreen <= (green >> 2);
newoled <= (newred << 11) + (newgreen << 5) + newblue;
toggle <= toggle ^ click;
if (reset != 1) begin
    counter = 0;
end
if (left != lastclick) begin
    counter <= isangry ? ((counter == 255) ? 255 : counter + 1) : ((counter + 2 >= 255) ? 255 : counter + 2);
end
lastclick <= left;
if (fasthz == newswap) begin
    newswap <= ~newswap;
    if (sw[3] && sw[0]) begin
        red <= (red == 0) ? 0 :red - 1;
    end
    else if (!sw[3] && sw[0]) begin
        red <= (red == 255) ? 255 : red + 1;
    end
    if (sw[3] && sw[1]) begin
        green <= (green == 0) ? 0 : green - 1;
    end
    else if (!sw[3] && sw[1]) begin
        green <= (green == 255) ? 255 : green + 1;
    end
    if (sw[3] && sw[2]) begin
        blue <= (blue == 0) ? 1 : blue - 1;
    end
    else if (!sw[3] && sw[2]) begin
        blue <= (blue == 255) ? 255 : blue + 1;
    end
end
if (onehz == swap) begin
    swap <= ~swap;
    counter = (counter <= 3) ? 0 : counter - 3;
end
withindistance <= counter * counter / 144;
if (x < cx) begin
    xdist <= cx - x;
end
else begin
    xdist <= x - cx;
end
if (y < cy) begin
    ydist <= cy - y;
end
else begin
    ydist <= y - cy;
end
currentdistance <= xdist*xdist + ydist*ydist; 
if (currentdistance + 25 < withindistance) begin
oled_pixel <= newoled;
end
else if (currentdistance < withindistance) begin
oled_pixel <= 16'b1111110011110011;
end
else begin
oled_pixel <= 0;
end
end
endmodule
