`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2023 15:34:08
// Design Name: 
// Module Name: slot_machine
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


module animate_venusaur(input CLOCK, output [7:0]JC, input[15:0] sw, input left, right, middle, input [11:0] xpos,ypos, input[3:0] state);
    wire frame_begin;
    wire [12:0] pixel_index;
    wire sending_pixels;
    wire sample_pixel;
    wire clock_LED;
    wire [8:0] x,y;
    reg [15:0]oled_data = 0;
    wire [15:0] oled_number, oled_numbercharge, oled_rain, oled_circle,oled_shooting,oled_alt,oled_crack;
    wire [15:0] oled_crackinv,oled_happy,oled_message, oled_sad, oled_angry, oled_mood, oled_hell, oled_clown;
    wire one_hz;
    wire [15:0]test_oled;
    reg [12:0] movingpixelindex = 0;
    reg [12:0] movingrainpixel = 0;
    reg [12:0] correctedhappyindex = 0;
    reg [7:0] brightness = 0; 
    wire [7:0] brightnessstore;
    reg [32:0] displaycount = 0;
    reg [2:0]nextlevel = 0;
    wire [12:0] pixels1, pixels2, pixels3;
    parameter pixelgap = 1152;
    parameter topgap = 287;
    reg isangry = 0;
    assign pixels3 = pixel_index - topgap;
    assign pixels1 = pixel_index - 2*pixelgap - topgap;
    assign pixels2 = pixel_index - 3*pixelgap - topgap;
    my_clk_divider LED_Clock(CLOCK, clock_LED, 7);
    Pixel_toXY pixel_XY(pixel_index,x,y);
    my_clk_divider onehz(CLOCK, one_hz, 4999999);
        Oled_DisplayModified unit_my_OLED (.clk(clock_LED), .reset(0), .frame_begin(frame_begin), .sending_pixels(sending_pixels),
          .sample_pixel(sample_pixel), .pixel_index(pixel_index), .pixel_data(oled_data), .cs(JC[0]), 
          .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]),
          .pmoden(JC[7]),.brightness(brightness));
          //.brightness(brightness)
    //venusaurbeam v1(CLOCK,movingpixelindex,oled_number);
    venusaurcharge v2(CLOCK,pixel_index,oled_numbercharge);
    rain v3(CLOCK,movingrainpixel,oled_rain);
    circle v4(CLOCK, x, y, oled_circle, nextlevel, brightnessstore, sw[3:0], left, right, middle, xpos, ypos, isangry);
    shooting v5(CLOCK, pixel_index,oled_shooting);
    crack v6(CLOCK, pixel_index, oled_crack);
    crackinv v7(CLOCK, pixel_index, oled_crackinv);
    venusaurhappy v8(CLOCK, pixel_index, oled_happy);
    message v9(CLOCK,pixel_index,oled_message);
    alternatebeam v1(CLOCK,movingpixelindex, oled_alt);
    angry angrys(CLOCK,pixels1, oled_angry);
    sad sads(CLOCK, pixels2, oled_sad);
    mood moods(CLOCK, pixels3, oled_mood);
    hell helldisplay(CLOCK, pixel_index, oled_hell);
    clown clowns(CLOCK, pixel_index, oled_clown);
    reg counter = 0;
    reg [9:0] raincount = 0;
    reg swap = 0;
    reg [2:0] frameswap = 0;
    reg toggled = 0;
    wire [8:0] xposa, yposa;
    
    assign xposa = xpos - 96;
    assign yposa = ypos;
    always @ (posedge CLOCK) begin
        if (state == 8) begin
            oled_data <= oled_clown;
            brightness <= 255;
        end
        else if (state != 9) begin
            nextlevel <= 0;
            oled_data <= 0;//16'b1111100000000000;
            brightness <= 255;
        end
        else if (state == 9)
        begin
        if (nextlevel == 0) 
        begin
            brightness <= 255;
            if (pixel_index <= topgap) begin
                oled_data <= 0;
            end
            else if (pixel_index <= pixelgap + topgap) begin
               oled_data <= oled_mood; 
            end
            else if (pixel_index <= 2*pixelgap + topgap) begin
                oled_data <= 0;
            end
            else if (pixel_index <= 3*pixelgap + topgap) begin
                if (xposa >= 0 && xposa <= 95 && yposa >= 27 && yposa <= 38) begin
                    oled_data <= ~oled_angry;
                    if (left) begin
                        nextlevel <= 1;
                        isangry <= 1;
                    end            
                end 
                else begin
                    oled_data <= oled_angry;
                end
            end 
            else if (pixel_index <= 4 * pixelgap + topgap) begin
                if (xposa >= 0 && xposa <= 95 && yposa >= 39 && yposa <= 50) begin
                    oled_data <= ~oled_sad;
                    if (left) begin
                        nextlevel <= 1;
                        isangry <= 0;
                    end
                end
                else begin
                    oled_data <= oled_sad;
                end
            end 
            else begin
                oled_data <= 0;
            end
        end
        else if (nextlevel == 1) 
        begin
            brightness = brightnessstore;
            if (brightness == 255) begin
                nextlevel <= 2;
            end
            if (one_hz == swap) begin
                swap <= ~swap;
                raincount <= (raincount == 64) ? 0 : raincount + 1;
            end
            if (oled_circle == 0) begin
                if (oled_numbercharge == 0) begin
                    if (isangry) begin
                        oled_data <= oled_hell;
                    end
                    else begin
                        if (pixel_index < (96*raincount)) begin
                            movingrainpixel <= 6143 - (96*raincount) + pixel_index;
                        end
                        else begin
                            movingrainpixel <= pixel_index - (96*raincount);
                        end
                        oled_data <= oled_rain;
                    end
                end
                else begin
                    oled_data <= oled_numbercharge;
                end
            end
            else begin
                oled_data <= oled_circle;
            end
        end
        else if (nextlevel == 2) 
        begin
            if (one_hz == counter) begin
                counter <= ~counter;
            end
            displaycount <= (displaycount == 249999999) ? displaycount : displaycount + 1;
            if (displaycount == 249999999) begin
                nextlevel <= 3;
                displaycount <= 0;
            end
            if (pixel_index < (96*counter)) begin
                movingpixelindex <= 6143 - (96*counter) + pixel_index;
            end
            else begin
                movingpixelindex <= pixel_index - (96*counter);
            end
            oled_data <= oled_alt;
        end
        else if (nextlevel == 3)
        begin
            if (pixel_index == 3000 && toggled == 0) begin
                frameswap <= (frameswap == 3) ? 0 : frameswap + 1;
                toggled <= 1;
            end
            else if (pixel_index != 3000) begin
                toggled <= 0;
            end
            displaycount <= (displaycount == 599999999) ? displaycount : displaycount + 1;
            if (displaycount == 599999999) begin
                nextlevel <= 4;
                displaycount <= 0;
            end
            if (oled_shooting != 0) begin
                if (frameswap == 0) begin
                    oled_data <= 16'b1111111111111111;
                end
                else begin
                //oled_data <= 16'b1111111111111111;
                    oled_data <= oled_shooting;
                end
            end
            else begin
                if (displaycount >= 199999999 && oled_crack != 0) begin
                    oled_data <= oled_crack;
                end
                else if (displaycount >= 399999999 && oled_crack == 0) begin
                    oled_data <= oled_crackinv;
                end
                else begin
                    oled_data <= 0;
                end
            end
        end
        else if (nextlevel == 4) 
        begin
            if (oled_happy != 0) begin
            oled_data <= oled_happy;
            end
            else begin
                if (pixel_index < 1819) begin
                oled_data <= oled_message;
                end
                else begin
                oled_data <= 0;
                end
            end
        end
    end
        else begin
            oled_data <= 0; 
        end
        if (x >= xposa - 1 && x <= xposa + 1 && y >= yposa - 1 && y <= yposa + 1) begin
            //oled_data <= 16'b1111100000000000;  
            oled_data <= 16'hFFFF;            
        end
    end
endmodule
