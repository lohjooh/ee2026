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


module Menu(input CLOCK, output [7:0]JA, input[15:0] sw, output reg [3:0] state = 0,input left, right, middle, input [11:0]xpos,ypos, input state6);
    wire frame_begin;
    wire [12:0] pixel_index;
    wire sending_pixels;
    wire sample_pixel;
    wire clock_LED;
    wire [8:0] x,y,invx,invy,invposx,invposy;
    reg [15:0]oled_data = 0;
    wire [15:0] oled_task, oled_improvement, oled_back;
    wire [15:0] oled_smallA, oled_smallB, oled_smallC, oled_smallD, oled_smallG;
    wire [15:0] oled_bigA, oled_bigB, oled_bigC, oled_bigD, oled_bigG;
    wire one_hz;
    wire [15:0]test_oled;
    reg [12:0] movingpixelindex = 0;
    reg [12:0] movingrainpixel = 0;
    wire [12:0] reverse_pixels;
    wire [12:0] reverse_pixels1, reverse_pixels2; //screen0
    wire [12:0] reverse_pixels3, reverse_pixels4, reverse_pixels5, reverse_pixels6, reverse_pixels7; //screen1
    wire [12:0] reverse_pixels8, reverse_pixels9, reverse_pixels10, reverse_pixels11, reverse_pixels12; //screen2
    wire Mhz25;
    //OLED CLOCK MODULE
    my_clk_divider LED_Clock(CLOCK, clock_LED, 7);
    
    //Pixel Index to XY Coords Module
    Pixel_toXY pixel_XY(pixel_index,x,y);
    
    my_clk_divider onehz(CLOCK, one_hz, 4999999);
    //SLOWER CLOCK MODULE
    my_clk_divider twentyfive(CLOCK, Mhz25, 1);
    
    //OLED Module
    Oled_Display unit_my_OLED (.clk(clock_LED), .reset(0), .frame_begin(frame_begin), .sending_pixels(sending_pixels),
      .sample_pixel(sample_pixel), .pixel_index(pixel_index), .pixel_data(oled_data), .cs(JA[0]), 
      .sdin(JA[1]), .sclk(JA[3]), .d_cn(JA[4]), .resn(JA[5]), .vccen(JA[6]),
      .pmoden(JA[7]));
    
    //reg [11:0] value = 192; reg setmax_x = 1; reg setmax_y = 1; reg middle_pressed = 0; //edited
      //wire left; wire right; wire middle;
      //wire [11:0]xpos; wire [11:0]ypos; 
      wire[8:0]yposa; wire [8:0]xposa;
      
      //wire middle, left, right;
//      MouseCtl mouse(.clk(CLOCK), //.rst(RESET), 
//          .value(value[11:0]),// .setx(setx), .sety(sety), 
//          .setmax_x(setmax_x), .setmax_y(setmax_y),
//          .xpos(xpos[11:0]), .ypos(ypos[11:0]),// .zpos(zpos[3:0]), 
//          .left(left), .middle(middle), .right(right), //.new_event(new_event), 
//          .ps2_clk(ps2_clk), .ps2_data(ps2_data)
//          );    
    reg toggled = 0;
    reg [1:0] screen = 0;
    parameter pixelgap = 1152;
    parameter topgap = 287;
    reg[1:0] prevScreen = 0;
    reg [31:0] displaycounter = 0;
    assign invx = 95 - x;
    assign invy = 63 - y;
    assign xposa = (xpos > 95) ? 96 : xpos;
    assign yposa = (ypos > 63) ? 64 : ypos;
    assign invposx = 95 - xposa;
    assign invposy = 63 - yposa;
    assign reverse_pixels = 6143 - pixel_index;
    assign reverse_pixels1 = 6143 - pixel_index - topgap;
    assign reverse_pixels2 = 6143 - pixel_index - pixelgap - topgap;
    assign reverse_pixels3 = 6143 - pixel_index - topgap;
    assign reverse_pixels4 = 6143 - pixel_index - pixelgap - topgap;
    assign reverse_pixels5 = 6143 - pixel_index - 2*pixelgap - topgap;
    assign reverse_pixels6 = 6143 - pixel_index - 3*pixelgap - topgap;
    assign reverse_pixels7 = 6143 - pixel_index - 4*pixelgap - topgap;
    assign reverse_pixels8 = 6143 - pixel_index - topgap;
    assign reverse_pixels9 = 6143 - pixel_index - pixelgap - topgap;
    assign reverse_pixels10 = 6143 - pixel_index - 2*pixelgap - topgap;
    assign reverse_pixels11 = 6143 - pixel_index - 3*pixelgap - topgap;
    assign reverse_pixels12 = 6143 - pixel_index - 4*pixelgap - topgap;

    tasks temp(CLOCK,reverse_pixels1,oled_task);
    improvementScreen improvement(CLOCK,reverse_pixels2,oled_improvement);
    menu_UI_student_A A(CLOCK, reverse_pixels3, oled_smallA);
    menu_UI_student_B B(CLOCK, reverse_pixels4, oled_smallB);
    menu_UI_student_C C(CLOCK, reverse_pixels5, oled_smallC);
    menu_UI_student_D D(CLOCK, reverse_pixels6, oled_smallD);
    menu_UI_student_G G(CLOCK, reverse_pixels7, oled_smallG);   
    paint a(CLOCK, reverse_pixels3, oled_bigA);
    music b(CLOCK, reverse_pixels4, oled_bigB);
    recognition c(CLOCK, reverse_pixels5, oled_bigC);
    animate d(CLOCK, reverse_pixels6, oled_bigD);
    morsecode g(CLOCK, reverse_pixels7, oled_bigG);
    BackButton back(CLOCK, reverse_pixels, oled_back);
    
    always @ (posedge Mhz25) begin
        displaycounter <= (displaycounter == 39999999) ? 39999999 : displaycounter + 1;
        //middle_pressed <= (middle == 1) ? ~middle_pressed : middle_pressed;
        if (displaycounter == 39999999)
        begin 
            //Main Menu for Task and Improvement
            if (screen == 0) 
            begin
                if (reverse_pixels <= topgap) begin //If 
                    oled_data <= 0;
                end
                else if (reverse_pixels <= pixelgap + topgap) begin
                    if (xposa >= 0 && xposa <= 95 && yposa >= 3 && yposa <= 14) begin
                        oled_data <= ~oled_task;
                        if (left) begin
                            screen <= 1;
                            displaycounter <= 0;
                            prevScreen = 1;
                        end            
                    end 
                    else begin
                        oled_data <= oled_task;
                    end
                end 
                else if (reverse_pixels <= 2 * pixelgap + topgap) begin
                    if (xposa >= 0 && xposa <= 95 && yposa >= 15 && yposa <= 26) begin
                        oled_data <= ~oled_improvement;
                        if (left) begin
                            screen <= 2;
                            displaycounter <= 0;
                            prevScreen = 2;
                        end
                    end
                    else begin
                        oled_data <= oled_improvement;
                    end
                end 
                else begin
                    oled_data <= 0;
                end
            end
            
            else if (screen == 1) 
            begin
                if (reverse_pixels <= topgap) begin
                    oled_data <= 0;
                    if (xposa >= 0 && xposa <= 95 && yposa >= 0 && yposa <= 2 && left) begin
                        screen <= 0;
                        displaycounter <= 0;
                    end
                end
                else if (reverse_pixels <= pixelgap + topgap) begin
                    if (xposa >= 0 && xposa <= 95 && yposa >= 3 && yposa <= 14) begin
                        oled_data <= ~oled_smallA;
                        if (left) begin
                            screen <= 3;
                            state = 1;
                            displaycounter <= 0;
                        end
                    end
                    else begin
                        oled_data <= oled_smallA;
                    end
                end 
                else if (reverse_pixels <= 2 * pixelgap + topgap) begin
                    if (xposa >= 0 && xposa <= 95 && yposa >= 15 && yposa <= 26) begin
                        oled_data <= ~oled_smallB;
                        if (left) begin
                            screen <= 3;
                            state = 2;
                            displaycounter <= 0;
                        end
                    end
                    else begin
                        oled_data <= oled_smallB;
                    end
                end 
                else if (reverse_pixels <= 3 * pixelgap + topgap) begin
                    if (xposa >= 0 && xposa <= 95 && yposa >= 27 && yposa <= 38) begin
                        oled_data <= ~oled_smallC;
                        if (left) begin
                            screen <= 3;
                            state = 3;
                            displaycounter <= 0;
                        end
                    end
                    else begin
                        oled_data <= oled_smallC;
                    end
                end 
                else if (reverse_pixels <= 4 * pixelgap + topgap) begin
                    if (xposa >= 0 && xposa <= 95 && yposa >= 39 && yposa <= 50) begin
                        oled_data <= ~oled_smallD;
                        if (left) begin
                            screen <= 3;
                            state = 4;
                            displaycounter <= 0;
                        end
                    end
                    else begin
                        oled_data <= oled_smallD;
                    end
                end 
                else if (reverse_pixels <= 5 * pixelgap + topgap) begin
                    if (xposa >= 0 && xposa <= 95 && yposa >= 51 && yposa <= 62) begin
                        oled_data <= ~oled_smallG;
                        if (left) begin
                            screen <= 3;
                            state = 5;
                            displaycounter <= 0;
                        end
                    end
                    else begin
                        oled_data = oled_smallG;
                    end
                end 
                else begin
                oled_data <= 0;
                end
            end
            else if (screen == 2) 
            begin
                if (reverse_pixels <= topgap) begin
                    oled_data = 0;
                    if (xposa >= 0 && xposa <= 95 && yposa >= 0 && yposa <= 2 && left) begin
                        screen <= 0;
                        displaycounter <= 0;
                    end
                end
                else if (reverse_pixels <= pixelgap + topgap) begin
                    if (xposa >= 0 && xposa <= 95 && yposa >= 3 && yposa <= 14) begin
                        oled_data <= ~oled_bigA;
                        if (left) begin
                            screen <= 3;
                            state = 6;
                            displaycounter <= 0;
                        end
                    end
                    else begin
                        oled_data <= oled_bigA;
                    end
                end 
                else if (reverse_pixels <= 2 * pixelgap + topgap) begin
                    if (xposa >= 0 && xposa <= 95 && yposa >= 15 && yposa <= 26) begin
                        oled_data <= ~oled_bigB;
                        if (left) begin
                            screen <= 3;
                            state = 7;
                            displaycounter <= 0;
                        end
                    end
                    else begin
                        oled_data <= oled_bigB;
                    end
                end 
                else if (reverse_pixels <= 3 * pixelgap + topgap) begin
                    if (xposa >= 0 && xposa <= 95 && yposa >= 27 && yposa <= 38) begin
                        oled_data <= ~oled_bigC;
                        if (left) begin
                            screen <= 3;
                            state = 8;
                            displaycounter <= 0;
                        end
                    end
                    else begin
                        oled_data <= oled_bigC;
                    end
                end 
                else if (reverse_pixels <= 4 * pixelgap + topgap) begin
                    if (xposa >= 0 && xposa <= 95 && yposa >= 39 && yposa <= 50) begin
                        oled_data <= ~oled_bigD;
                        if (left) begin
                            screen <= 3;
                            state = 9;
                            displaycounter <= 0;
                        end
                    end
                    else begin
                        oled_data <= oled_bigD;
                    end
                end 
                else if (reverse_pixels <= 5 * pixelgap + topgap) begin
                    if (xposa >= 0 && xposa <= 95 && yposa >= 51 && yposa <= 62) begin
                        oled_data <= ~oled_bigG;
                        if (left) begin
                            screen <= 3;
                            state = 10;
                            displaycounter <= 0;
                        end
                    end
                    else begin
                        oled_data <= oled_bigG;
                    end
                end 
                else begin
                oled_data <= 0;
                end
            end
            else if (screen == 3) 
            begin
                if(invx >= 26 && invx <= 66 && invy >= 21 && invy <= 42) begin
                    oled_data <= oled_back;
                    if(xposa >= 26 && xposa <= 66 && yposa >= 21 && yposa <= 42 && left) begin
                        //prevState <= state;
                        if (!(state6 && state == 6)) begin
                        screen <= prevScreen;
                        displaycounter <= 0;
                        state = 0;
                        end
                    end
                end
                else begin
                oled_data <= 0;
                end
            end
            else begin
                oled_data <= 0;
            end
            if ((y >= invposy - 1) && (y <= invposy + 1) && (x >= invposx - 1) && (x <= invposx + 1)) 
            begin   
               oled_data <= 16'b1111100000000000;
            end
        end //displaycounter
        else begin
            oled_data <= 0;
        end
    end
endmodule
