`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT A NAME: 
//  STUDENT B NAME:
//  STUDENT C NAME: 
//  STUDENT D NAME:  
//
//////////////////////////////////////////////////////////////////////////////////


module StudentD(input CLOCK, output [7:0]JC, input sw15, input[9:0] sw);
    wire frame_begin;
    wire [12:0] pixel_index;
    wire sending_pixels;
    wire sample_pixel;
    wire clock_LED;
    wire [8:0] x,y;
    reg [15:0]oled_data = 16'b1111100000000000;
    wire [15:0] oled_number;
    wire [5:0] six_side;
    wire [6:0] seg;
    Pixel_toXY pixel_XY(pixel_index,x,y);
    my_clk_divider LED_Clock(CLOCK, clock_LED, 7);
    Oled_Display unit_my_OLED (.clk(clock_LED), .reset(0), .frame_begin(frame_begin), .sending_pixels(sending_pixels),
      .sample_pixel(sample_pixel), .pixel_index(pixel_index), .pixel_data(oled_data), .cs(JC[0]), 
      .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]),
      .pmoden(JC[7]));
    Group_seven_seg_individual makenum(CLOCK, x, y, oled_number, six_side, seg);
    Oled_Switch_Number_D switch(CLOCK, sw, six_side, seg);
    always @(posedge CLOCK) begin
        if (x >= 57 && x <= 59 && y <= 59 && sw15 == 0) 
        begin
        oled_data <= 16'h07E0;
        end
        else if (y >= 57 && y <= 59 && x <= 59 && sw15 == 0)
        begin
        oled_data <= 16'h07E0;
        end
        else if (x <= 57 && y <= 57)
        begin
        oled_data <= oled_number;
        end
        else
        begin
        oled_data <= 0;
        end
    end    

endmodule