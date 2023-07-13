`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2023 23:22:39
// Design Name: 
// Module Name: StudentC
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


module StudentC(
    input clock, input sw0, input left, right, middle, input [11:0]xpos, input [11:0]ypos,
    output [7:0]JC, output reg [15:13]led
);
    
reg middle_pressed = 0;
wire [11:0]xposa;
reg [11:0]ypos_adjusted; reg [11:0]xpos_adjusted;
wire frame_begin;
wire [12:0] pixel_index;
wire sending_pixels;
wire sample_pixel;
wire clock_LED;
wire [8:0] x,y;
reg [15:0]oled_data= 16'b1111111111111111;

assign xposa = xpos - 96;

Pixel_toXY pixel_XY(pixel_index[12:0], x, y);

my_clk_divider LED_Clock(clock, clock_LED, 7);

Oled_Display unit_my_OLED (.clk(clock_LED), .reset(0), .frame_begin(frame_begin), .sending_pixels(sending_pixels),
.sample_pixel(sample_pixel), .pixel_index(pixel_index), .pixel_data(oled_data), .cs(JC[0]), 
.sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]),
.pmoden(JC[7]));
 

always @ (posedge clock) begin
    middle_pressed <= (led[14] == 1) ? ~middle_pressed : middle_pressed;
    
    case (sw0)    
    1: begin
        case (middle_pressed)
        1: begin
            xpos_adjusted[11:0] <= (xpos >= 94) ? (xpos <= 96) ? 94 : 1 : xpos; 
        end
        0: begin
            xpos_adjusted[11:0] <= (xpos >= 95) ? (xpos <= 96) ? 95 : 0 : xpos; 
        end
        endcase
    end
    0: begin
        case (middle_pressed)
        1: begin
            xpos_adjusted[11:0] <= (xpos >= 94) ? (xpos <= 96) ? 94 : xpos : xpos;
        end
        0: begin
            xpos_adjusted[11:0] <= (xpos >= 95) ? (xpos <= 96) ? 95 : xpos : xpos;
        end
        endcase
    end
    endcase                       
    
    led[13] <= (right == 1) ? 1 : 0;
    led[14] <= (middle == 1) ? 1 : 0;
    led[15] <= (left == 1) ? 1 : 0;

    if (middle_pressed == 0 && x == xpos_adjusted && y == ypos) begin
        oled_data <= 16'b1111100000000000;
    end
    else if (middle_pressed == 1 && x >= xpos_adjusted - 1 && x <= xpos_adjusted + 1 && y >= ypos - 1 && y <= ypos + 1) begin
        oled_data <= 16'b0000000000011111;
    end
    else begin
        oled_data <= 0;
    end
end

endmodule
