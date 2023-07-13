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


module Group_seven_seg(
    input CLOCK, 
    input[8:0] x,y,  
    output reg [15:0] oled_data, 
    input[5:0]six_side, 
    input[6:0]seg, 
    output reg [3:0] number = 0, 
    output reg flag = 0, 
    input left, right, middle, 
    input sw15,
    input [11:0] xposna,ypos
    );

    //reg [11:0] value = 94; reg setmax_x = 1; reg setmax_y = 1; 
    reg middle_pressed = 0;
    //wire left; wire right; wire middle;
    //wire [11:0]xpos; wire [11:0]ypos; 
    reg [11:0]ypos_adjusted;
        
//    MouseCtl mouse(.clk(CLOCK), //.rst(RESET), 
//        .value(value[11:0]),// .setx(setx), .sety(sety), 
//        .setmax_x(setmax_x), .setmax_y(setmax_y),
//        .xpos(xpos[11:0]), .ypos(ypos[11:0]),// .zpos(zpos[3:0]), 
//        .left(left), .middle(middle), .right(right), //.new_event(new_event), 
//        .ps2_clk(ps2_clk), .ps2_data(ps2_data)
//        );
    wire [11:0] xpos;
    assign xpos = xposna - 96;
    reg [12:0] ispressed = 0;
    reg [5:0]six_sides = 0;
    reg [6:0]segs = 0;
    reg stop = 0;
    always @(posedge CLOCK) begin
        middle_pressed <= (middle == 1) ? ~middle_pressed : middle_pressed;
        if (middle_pressed == 0 && x == xpos && y == ypos) begin            
            oled_data <= 16'b1111100000000000;
        end
        else if (middle_pressed == 1 && x >= xpos - 1 && x <= xpos + 1 && y >= ypos - 1 && y <= ypos + 1) begin
            oled_data <= 16'b0000000000011111;              
        end 
        else begin
            if (sw15) begin
                if (stop == 0) begin
                //num0
                    if (six_sides == 6'b111111 && segs == 7'b1111110) begin
                        flag <= 1;
                        number <= 0;
                        stop <= 1;
                    end
                    //num1
                    else if (six_sides == 6'b101010 && segs == 7'b0110000) begin
                        flag <= 1;
                        number <= 1;
                        stop <= 1;
                    end
                    //num2
                    else if (six_sides == 6'b111111 && segs == 7'b1101101) begin
                        flag <= 1;
                        number <= 2;
                        stop <= 1;
                    end
                    //num3
                    else if (six_sides == 6'b111111 && segs == 7'b1111001) begin
                        flag <= 1;
                        number <= 3;
                        stop <= 1;
                    end
                    //num4
                    else if (six_sides == 6'b101111 && segs == 7'b0110011) begin
                        flag <= 1;
                        number <= 4;
                        stop <= 1;
                    end
                    //num5
                    else if (six_sides == 6'b111111 && segs == 7'b1011011) begin
                        flag <= 1;
                        number <= 5;
                        stop <= 1;
                    end
                    //num6
                    else if (six_sides == 6'b111111 && segs == 7'b1011111) begin
                        flag <= 1;
                        number <= 6;
                        stop <= 1;
                    end
                    //num7
                    else if (six_sides == 6'b101011 && segs == 7'b1110000) begin
                        flag <= 1;
                        number <= 7;
                        stop <= 1;
                    end
                    //num8
                    else if (six_sides == 6'b111111 && segs == 7'b1111111) begin
                        flag <= 1;
                        number <= 8;
                        stop <= 1;
                    end
                    //num9
                    else if (six_sides == 6'b111111 && segs == 7'b1111011) begin
                        flag <= 1;
                        number <= 9;
                        stop <= 1;
                    end
                //no flag
                else begin
                    flag <= 0;
                    number <= 10;
                end
            end
        end
        else begin
            if (stop == 1) begin
                segs <= 0;
                six_sides <= 0;
            end
            flag <= 0;
            number <= 10;
            stop <= 0;
        end
    
    //topleft
        if (xpos >= 14 && xpos <= 18 && ypos >= 8 && ypos <= 12) begin
            if (left) begin
                six_sides[0] <= 1;
            end
            else if (right) begin
                six_sides[0] <= 0;
            end
        end
        //topright
        else if (xpos >= 38 && xpos <= 42 && ypos >= 8 && ypos <= 12)
        begin
            if (left) begin
                six_sides[1] <= 1;
            end
            else if (right) begin
                six_sides[1] <= 0;
            end
        end
        //midleft
        else if (xpos >= 14 && xpos <= 18 && ypos >= 26 && ypos <= 30) begin
            if (left) begin
                six_sides[2] <= 1;
            end
            else if (right) begin
                six_sides[2] <= 0;
            end
        end
        //midright
        else if (xpos >= 38 && xpos <= 42 && ypos >= 26 && ypos <= 30) begin
            if (left) begin
                six_sides[3] <= 1;
            end
            else if (right) begin
                six_sides[3] <= 0;
            end
        end
        //botleft
        else if (xpos >= 14 && xpos <= 18 && ypos >= 44 && ypos <= 48) begin
            if (left) begin
                six_sides[4] <= 1;
            end
            else if (right) begin
                six_sides[4] <= 0;
            end
        end
        //botright
        else if (xpos >= 38 && xpos <= 42 && ypos >= 44 && ypos <= 48) begin
            if (left) begin
                six_sides[5] <= 1;
            end
            else if (right) begin
                six_sides[5] <= 0;
            end
        end
        //segsa
        else if (xpos >= 19 && xpos <= 37 && ypos >= 8 && ypos <= 12) begin
            if (left) begin
                segs[6] <= 1;
            end
            else if (right) begin
                segs[6] <= 0;
            end
        end
        //segsb
        else if (xpos >= 38 && xpos <= 42 && ypos >= 13 && ypos <= 25) begin
            if (left) begin
                segs[5] <= 1;
            end
            else if (right) begin
                segs[5] <= 0;
            end
        end
        //segsc
        else if (xpos >= 38 && xpos <= 42 && ypos >= 31 && ypos <= 43) begin
            if (left) begin
                segs[4] <= 1;
            end
            else if (right) begin
                segs[4] <= 0;
            end
        end
        //segsd
        else if (xpos >= 19 && xpos <= 37 && ypos >= 44 && ypos <= 48) begin
            if (left) begin
                segs[3] <= 1;
            end
            else if (right) begin
                segs[3] <= 0;
            end
        end
        //segse
        else if (xpos >= 14 && xpos <= 18 && ypos >= 31 && ypos <= 43) begin
            if (left) begin
                segs[2] <= 1;
            end
            else if (right) begin
                segs[2] <= 0;
            end
        end
        //segsf
        else if (xpos >= 14 && xpos <= 18 && ypos >= 13 && ypos <= 25) begin
            if (left) begin
                segs[1] <= 1;
            end
            else if (right) begin
                segs[1] <= 0;
            end
        end
        //segsg
        else if (xpos >= 19 && xpos <= 37 && ypos >= 26 && ypos <= 30) begin
            if (left) begin
                segs[0] <= 1;
            end
            else if (right) begin
                segs[0] <= 0;
            end
        end
        
        //Topleft
        if (x >= 14 && x <= 18 && y >= 8 && y <= 12 && (six_side[0] || six_sides[0]))
        begin
            oled_data <= 16'hFFFF;
        end
        //Topright
        else if (x >= 38 && x <= 42 && y >= 8 && y <= 12 && (six_side[1] || six_sides[1]))
        begin
            oled_data <=16'hFFFF;
        end
        //Midleft
        else if (x >= 14 && x <= 18 && y >= 26 && y <= 30 && (six_side[2] || six_sides[2]))
        begin
            oled_data <=16'hFFFF;
        end
        //Midright
        else if (x >= 38 && x <= 42 && y >= 26 && y <= 30 && (six_side[3] || six_sides[3]))
        begin
            oled_data <=16'hFFFF;
        end
        //Botleft
        else if (x >= 14 && x <= 18 && y >= 44 && y <= 48 && (six_side[4] || six_sides[4]))
        begin
            oled_data <=16'hFFFF;
        end
        //Botright
        else if (x >= 38 && x <= 42 && y >= 44 && y <= 48 && (six_side[5] || six_sides[5]))
        begin
            oled_data <=16'hFFFF;
        end
        //sega
        else if (x >= 19 && x <= 37 && y >= 8 && y <= 12 && (seg[6] || segs[6]))
        begin
            oled_data <=16'hFFFF;
        end
        //segb
        else if (x >= 38 && x <= 42 && y >= 13 && y <= 25 && (seg[5] || segs[5]))
        begin
            oled_data <=16'hFFFF;
        end
        //segc
        else if (x >= 38 && x <= 42 && y >= 31 && y <= 43 && (seg[4] || segs[4]))
        begin
            oled_data <=16'hFFFF;
        end
        //segd
        else if (x >= 19 && x <= 37 && y >= 44 && y <= 48 && (seg[3] || segs[3]))
        begin
            oled_data <=16'hFFFF;
        end
        //sege
        else if (x >= 14 && x <= 18 && y >= 31 && y <= 43 && (seg[2] || segs[2]))
        begin
            oled_data <=16'hFFFF;
        end
        //segf
        else if (x >= 14 && x <= 18 && y >= 13 && y <= 25 && (seg[1] || segs[1]))
        begin
            oled_data <=16'hFFFF;
        end
        //segg
        else if (x >= 19 && x <= 37 && y >= 26 && y <= 30 && (seg[0] || segs[0]))
        begin
            oled_data <=16'hFFFF;
        end
        //Borders
        else if ((x == 14 || x == 18 || x == 38 ||  x == 42) && y >= 8 && y <= 48)
        begin
            oled_data <= 16'hFFFF;
        end
        else if ((y == 8 || y == 12 || y == 26 || y == 30 || y == 44 || y == 48) && x >= 14 && x <= 42)
        begin
            oled_data <= 16'hFFFF;
        end
        //Everything Else Black Screen
        else
        begin
            oled_data <= 0;
        end
        end
    end
      
endmodule
