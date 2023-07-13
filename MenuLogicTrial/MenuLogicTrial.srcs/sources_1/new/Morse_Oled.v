`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2023 10:54:51
// Design Name: 
// Module Name: Morse_Oled
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


module Morse_Oled(
    input clock,
    input clk20kHz,
    input [1:0] next_flag,
    input [4:0] morse_letter,
    input reset_flag,
    input test_flag,
    output [7:0] JC
    );
    
    //BOX 12 x 12 = 12 long 12 tall
    //40 boxes = 8 boxes long by 5 boxes tall
    reg [4:0] box_letter [39:0];
    reg [5:0] curr_box = 0; //Current box being updated
    
    //Initialize
    integer i;
    initial begin
        for (i=0; i<40; i=i+1) begin
            box_letter[i] = 26; //26 is an empty box
        end
    end
    
    //Stores the letter
    always @(posedge clk20kHz) begin
        if (reset_flag) begin
            for (i=0; i<40; i=i+1) begin
                box_letter[i] = 26;
            end
            curr_box <= 0;
        end
        //TEST
        else if (test_flag) begin
            for (i=0; i<26; i=i+1) begin
                box_letter[i] = i;
            end
            curr_box <= 0;
        end
        //TEST END
        else if (curr_box < 40) begin
            //Next letter
            if (next_flag == 2) begin
                box_letter[curr_box] <= morse_letter;
                curr_box <= curr_box + 1;
            end
            //Next word
            else if (next_flag == 3) begin
                box_letter[curr_box] <= morse_letter;
                curr_box <= curr_box + 2;
            end
        end
    end
    
    parameter [12:0] firstpixel_firstbox = 192;
    reg [12:0] firstpixel_index = 0; //Top left pixel of box 
    reg [8:0] box_x, box_y = 0;
    wire [12:0] pixel_index;
    reg [15:0] pixel_data = 0;
    reg [5:0] pixel_box = 40; //The box the current pixel is in | 40 is for not in any box
    wire [8:0] pixel_x, pixel_y;
    reg [8:0] box_pixel = 0; //The pixel on the hardcoded letter the current pixel corresponds to
    
    wire clock_LED;
    my_clk_divider LED_Clock(clock, clock_LED, 7);
    Pixel_toXY pixelXY (.index(pixel_index), .x(pixel_x), .y(pixel_y));
    
    wire frame_begin;
    wire sending_pixels;
    wire sample_pixel;
    Oled_Display unit_my_OLED (.clk(clock_LED), .reset(reset_flag), .frame_begin(frame_begin), 
    .sending_pixels(sending_pixels), .sample_pixel(sample_pixel), .pixel_index(pixel_index), 
    .pixel_data(pixel_data), .cs(JC[0]), .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]),
    .pmoden(JC[7]));
    
    
    //INSTANT SET NOT NON-BLOCKING TO TAKE ADVANTAGE OF INSTANT ASSIGNMENT
    //STANDARDISE "="
    always @(pixel_index) begin
        //First and last 2 rows empty -> not within any box
        if (pixel_y < 2 || pixel_y > 61 || reset_flag) begin
            pixel_box = 40; //Not in box
        end
        //Else is within a box
        else begin
            //box 0 to 7
            box_x = pixel_x / 12;
            //row 0 to 4
            box_y = ((pixel_y - 2) / 12);
            //calculate top left pixel of box
            firstpixel_index = firstpixel_firstbox + box_x * 12 + box_y * 96 * 12;
            //row * 8 as 8 per row + col
            //box number
            pixel_box = box_x + box_y * 8;
            //Value of pixel correspinding to pixel in letter(alphabet)
            box_pixel = ((pixel_index - firstpixel_index) % 96) + ((pixel_index - firstpixel_index)/96) * 12;             
        end
    end
    
    reg [4:0] letter_oled = 26;
    always @(*) begin
        if (pixel_box < 40) letter_oled <= box_letter[pixel_box];
        else letter_oled <= 26;
    end
    
    //HARDCODE LETTERS HERE
    //LETTERS MUST BE 12 x 12 (height x length)
    always @(*) begin
        case(letter_oled)
            //A
            0:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                38:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                43:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                45:pixel_data <= 16'b1111111111111111;
                50:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                57:pixel_data <= 16'b1111111111111111;
                62:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                67:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                69:pixel_data <= 16'b1111111111111111;
                74:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                76:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                79:pixel_data <= 16'b1111111111111111;
                80:pixel_data <= 16'b1111111111111111;
                81:pixel_data <= 16'b1111111111111111;
                86:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                93:pixel_data <= 16'b1111111111111111;
                98:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                105:pixel_data <= 16'b1111111111111111;
                110:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                117:pixel_data <= 16'b1111111111111111;
                123:pixel_data <= 16'b1111111111111111;
                128:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //B
            1:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                15:pixel_data <= 16'b1111111111111111;
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                26:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                38:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                43:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                45:pixel_data <= 16'b1111111111111111;
                50:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                57:pixel_data <= 16'b1111111111111111;
                62:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                67:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                74:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                79:pixel_data <= 16'b1111111111111111;
                80:pixel_data <= 16'b1111111111111111;
                86:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                93:pixel_data <= 16'b1111111111111111;
                98:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                103:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                105:pixel_data <= 16'b1111111111111111;
                110:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                123:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //C
            2:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                41:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                52:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                76:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                88:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                101:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //D
            3:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                15:pixel_data <= 16'b1111111111111111;
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                26:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                38:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                43:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                45:pixel_data <= 16'b1111111111111111;
                50:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                57:pixel_data <= 16'b1111111111111111;
                62:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                69:pixel_data <= 16'b1111111111111111;
                74:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                80:pixel_data <= 16'b1111111111111111;
                81:pixel_data <= 16'b1111111111111111;
                86:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                93:pixel_data <= 16'b1111111111111111;
                98:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                103:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                105:pixel_data <= 16'b1111111111111111;
                110:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                123:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //E
            4:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                41:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                52:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                76:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                88:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                101:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //F
            5:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                41:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                52:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                76:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                88:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //G
            6:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                20:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                33:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                41:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                52:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                67:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                69:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                76:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                79:pixel_data <= 16'b1111111111111111;
                80:pixel_data <= 16'b1111111111111111;
                81:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                88:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                93:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                101:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                105:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                117:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                128:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //H
            7:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                15:pixel_data <= 16'b1111111111111111;
                20:pixel_data <= 16'b1111111111111111;
                26:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                33:pixel_data <= 16'b1111111111111111;
                38:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                45:pixel_data <= 16'b1111111111111111;
                50:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                57:pixel_data <= 16'b1111111111111111;
                62:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                67:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                69:pixel_data <= 16'b1111111111111111;
                74:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                76:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                79:pixel_data <= 16'b1111111111111111;
                80:pixel_data <= 16'b1111111111111111;
                81:pixel_data <= 16'b1111111111111111;
                86:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                93:pixel_data <= 16'b1111111111111111;
                98:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                105:pixel_data <= 16'b1111111111111111;
                110:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                117:pixel_data <= 16'b1111111111111111;
                123:pixel_data <= 16'b1111111111111111;
                128:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //I
            8:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                30:pixel_data <= 16'b1111111111111111;
                41:pixel_data <= 16'b1111111111111111;
                42:pixel_data <= 16'b1111111111111111;
                53:pixel_data <= 16'b1111111111111111;
                54:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                89:pixel_data <= 16'b1111111111111111;
                90:pixel_data <= 16'b1111111111111111;
                101:pixel_data <= 16'b1111111111111111;
                102:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                137:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //J
            9:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                19:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                43:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                55:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                67:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                79:pixel_data <= 16'b1111111111111111;
                80:pixel_data <= 16'b1111111111111111;
                91:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                102:pixel_data <= 16'b1111111111111111;
                103:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //K
            10:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                15:pixel_data <= 16'b1111111111111111;
                20:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                43:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                52:pixel_data <= 16'b1111111111111111;
                54:pixel_data <= 16'b1111111111111111;
                55:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                67:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                76:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                79:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                88:pixel_data <= 16'b1111111111111111;
                90:pixel_data <= 16'b1111111111111111;
                91:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                103:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                123:pixel_data <= 16'b1111111111111111;
                128:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //L
            11:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                16:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                52:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                76:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                88:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                101:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //M
            12:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                14:pixel_data <= 16'b1111111111111111;
                21:pixel_data <= 16'b1111111111111111;
                25:pixel_data <= 16'b1111111111111111;
                26:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                33:pixel_data <= 16'b1111111111111111;
                34:pixel_data <= 16'b1111111111111111;
                37:pixel_data <= 16'b1111111111111111;
                38:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                43:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                45:pixel_data <= 16'b1111111111111111;
                46:pixel_data <= 16'b1111111111111111;
                49:pixel_data <= 16'b1111111111111111;
                50:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                52:pixel_data <= 16'b1111111111111111;
                53:pixel_data <= 16'b1111111111111111;
                54:pixel_data <= 16'b1111111111111111;
                55:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                57:pixel_data <= 16'b1111111111111111;
                58:pixel_data <= 16'b1111111111111111;
                61:pixel_data <= 16'b1111111111111111;
                62:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                67:pixel_data <= 16'b1111111111111111;
                69:pixel_data <= 16'b1111111111111111;
                70:pixel_data <= 16'b1111111111111111;
                73:pixel_data <= 16'b1111111111111111;
                74:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                81:pixel_data <= 16'b1111111111111111;
                82:pixel_data <= 16'b1111111111111111;
                85:pixel_data <= 16'b1111111111111111;
                86:pixel_data <= 16'b1111111111111111;
                93:pixel_data <= 16'b1111111111111111;
                94:pixel_data <= 16'b1111111111111111;
                97:pixel_data <= 16'b1111111111111111;
                98:pixel_data <= 16'b1111111111111111;
                105:pixel_data <= 16'b1111111111111111;
                106:pixel_data <= 16'b1111111111111111;
                109:pixel_data <= 16'b1111111111111111;
                110:pixel_data <= 16'b1111111111111111;
                117:pixel_data <= 16'b1111111111111111;
                118:pixel_data <= 16'b1111111111111111;
                122:pixel_data <= 16'b1111111111111111;
                129:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //N
            13:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                15:pixel_data <= 16'b1111111111111111;
                20:pixel_data <= 16'b1111111111111111;
                26:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                33:pixel_data <= 16'b1111111111111111;
                38:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                41:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                45:pixel_data <= 16'b1111111111111111;
                50:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                52:pixel_data <= 16'b1111111111111111;
                53:pixel_data <= 16'b1111111111111111;
                54:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                57:pixel_data <= 16'b1111111111111111;
                62:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                67:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                69:pixel_data <= 16'b1111111111111111;
                74:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                79:pixel_data <= 16'b1111111111111111;
                80:pixel_data <= 16'b1111111111111111;
                81:pixel_data <= 16'b1111111111111111;
                86:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                91:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                93:pixel_data <= 16'b1111111111111111;
                98:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                105:pixel_data <= 16'b1111111111111111;
                110:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                117:pixel_data <= 16'b1111111111111111;
                123:pixel_data <= 16'b1111111111111111;
                128:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //O
            14:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                15:pixel_data <= 16'b1111111111111111;
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                20:pixel_data <= 16'b1111111111111111;
                26:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                33:pixel_data <= 16'b1111111111111111;
                38:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                43:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                45:pixel_data <= 16'b1111111111111111;
                50:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                57:pixel_data <= 16'b1111111111111111;
                62:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                69:pixel_data <= 16'b1111111111111111;
                74:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                80:pixel_data <= 16'b1111111111111111;
                81:pixel_data <= 16'b1111111111111111;
                86:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                93:pixel_data <= 16'b1111111111111111;
                98:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                103:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                105:pixel_data <= 16'b1111111111111111;
                110:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                117:pixel_data <= 16'b1111111111111111;
                123:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                128:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //P
            15:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                43:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                52:pixel_data <= 16'b1111111111111111;
                55:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                67:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                76:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                79:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                88:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //Q
            16:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                15:pixel_data <= 16'b1111111111111111;
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                20:pixel_data <= 16'b1111111111111111;
                26:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                33:pixel_data <= 16'b1111111111111111;
                38:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                43:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                45:pixel_data <= 16'b1111111111111111;
                50:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                57:pixel_data <= 16'b1111111111111111;
                62:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                69:pixel_data <= 16'b1111111111111111;
                74:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                80:pixel_data <= 16'b1111111111111111;
                81:pixel_data <= 16'b1111111111111111;
                86:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                89:pixel_data <= 16'b1111111111111111;
                90:pixel_data <= 16'b1111111111111111;
                91:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                98:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                102:pixel_data <= 16'b1111111111111111;
                103:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                105:pixel_data <= 16'b1111111111111111;
                110:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                117:pixel_data <= 16'b1111111111111111;
                123:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                128:pixel_data <= 16'b1111111111111111;
                129:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //R
            17:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                43:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                52:pixel_data <= 16'b1111111111111111;
                55:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                67:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                76:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                79:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                88:pixel_data <= 16'b1111111111111111;
                89:pixel_data <= 16'b1111111111111111;
                90:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                101:pixel_data <= 16'b1111111111111111;
                102:pixel_data <= 16'b1111111111111111;
                103:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                128:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //S
            18:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                41:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                52:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                67:pixel_data <= 16'b1111111111111111;
                76:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                79:pixel_data <= 16'b1111111111111111;
                80:pixel_data <= 16'b1111111111111111;
                91:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                102:pixel_data <= 16'b1111111111111111;
                103:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //T
            19:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                14:pixel_data <= 16'b1111111111111111;
                15:pixel_data <= 16'b1111111111111111;
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                20:pixel_data <= 16'b1111111111111111;
                21:pixel_data <= 16'b1111111111111111;
                25:pixel_data <= 16'b1111111111111111;
                26:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                33:pixel_data <= 16'b1111111111111111;
                34:pixel_data <= 16'b1111111111111111;
                41:pixel_data <= 16'b1111111111111111;
                42:pixel_data <= 16'b1111111111111111;
                53:pixel_data <= 16'b1111111111111111;
                54:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                89:pixel_data <= 16'b1111111111111111;
                90:pixel_data <= 16'b1111111111111111;
                101:pixel_data <= 16'b1111111111111111;
                102:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //U
            20:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                15:pixel_data <= 16'b1111111111111111;
                20:pixel_data <= 16'b1111111111111111;
                26:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                33:pixel_data <= 16'b1111111111111111;
                38:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                45:pixel_data <= 16'b1111111111111111;
                50:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                57:pixel_data <= 16'b1111111111111111;
                62:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                69:pixel_data <= 16'b1111111111111111;
                74:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                80:pixel_data <= 16'b1111111111111111;
                81:pixel_data <= 16'b1111111111111111;
                86:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                93:pixel_data <= 16'b1111111111111111;
                98:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                103:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                105:pixel_data <= 16'b1111111111111111;
                110:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                117:pixel_data <= 16'b1111111111111111;
                123:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                128:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //V
            21:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                15:pixel_data <= 16'b1111111111111111;
                20:pixel_data <= 16'b1111111111111111;
                26:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                33:pixel_data <= 16'b1111111111111111;
                38:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                45:pixel_data <= 16'b1111111111111111;
                50:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                57:pixel_data <= 16'b1111111111111111;
                62:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                69:pixel_data <= 16'b1111111111111111;
                74:pixel_data <= 16'b1111111111111111;
                75:pixel_data <= 16'b1111111111111111;
                79:pixel_data <= 16'b1111111111111111;
                80:pixel_data <= 16'b1111111111111111;
                81:pixel_data <= 16'b1111111111111111;
                86:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                90:pixel_data <= 16'b1111111111111111;
                91:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                98:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                101:pixel_data <= 16'b1111111111111111;
                102:pixel_data <= 16'b1111111111111111;
                103:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //W
            22:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                14:pixel_data <= 16'b1111111111111111;
                21:pixel_data <= 16'b1111111111111111;
                25:pixel_data <= 16'b1111111111111111;
                26:pixel_data <= 16'b1111111111111111;
                33:pixel_data <= 16'b1111111111111111;
                34:pixel_data <= 16'b1111111111111111;
                37:pixel_data <= 16'b1111111111111111;
                38:pixel_data <= 16'b1111111111111111;
                45:pixel_data <= 16'b1111111111111111;
                46:pixel_data <= 16'b1111111111111111;
                49:pixel_data <= 16'b1111111111111111;
                50:pixel_data <= 16'b1111111111111111;
                57:pixel_data <= 16'b1111111111111111;
                58:pixel_data <= 16'b1111111111111111;
                61:pixel_data <= 16'b1111111111111111;
                62:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                69:pixel_data <= 16'b1111111111111111;
                70:pixel_data <= 16'b1111111111111111;
                73:pixel_data <= 16'b1111111111111111;
                74:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                81:pixel_data <= 16'b1111111111111111;
                82:pixel_data <= 16'b1111111111111111;
                85:pixel_data <= 16'b1111111111111111;
                86:pixel_data <= 16'b1111111111111111;
                89:pixel_data <= 16'b1111111111111111;
                90:pixel_data <= 16'b1111111111111111;
                93:pixel_data <= 16'b1111111111111111;
                94:pixel_data <= 16'b1111111111111111;
                97:pixel_data <= 16'b1111111111111111;
                98:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                101:pixel_data <= 16'b1111111111111111;
                102:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                105:pixel_data <= 16'b1111111111111111;
                106:pixel_data <= 16'b1111111111111111;
                110:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                117:pixel_data <= 16'b1111111111111111;
                123:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                128:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //X
            23:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                16:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                40:pixel_data <= 16'b1111111111111111;
                43:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                52:pixel_data <= 16'b1111111111111111;
                54:pixel_data <= 16'b1111111111111111;
                55:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                67:pixel_data <= 16'b1111111111111111;
                76:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                79:pixel_data <= 16'b1111111111111111;
                87:pixel_data <= 16'b1111111111111111;
                88:pixel_data <= 16'b1111111111111111;
                89:pixel_data <= 16'b1111111111111111;
                91:pixel_data <= 16'b1111111111111111;
                92:pixel_data <= 16'b1111111111111111;
                99:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                103:pixel_data <= 16'b1111111111111111;
                104:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                116:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //Y
            24:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                15:pixel_data <= 16'b1111111111111111;
                20:pixel_data <= 16'b1111111111111111;
                26:pixel_data <= 16'b1111111111111111;
                27:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                33:pixel_data <= 16'b1111111111111111;
                38:pixel_data <= 16'b1111111111111111;
                39:pixel_data <= 16'b1111111111111111;
                44:pixel_data <= 16'b1111111111111111;
                45:pixel_data <= 16'b1111111111111111;
                50:pixel_data <= 16'b1111111111111111;
                51:pixel_data <= 16'b1111111111111111;
                52:pixel_data <= 16'b1111111111111111;
                55:pixel_data <= 16'b1111111111111111;
                56:pixel_data <= 16'b1111111111111111;
                57:pixel_data <= 16'b1111111111111111;
                63:pixel_data <= 16'b1111111111111111;
                64:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                67:pixel_data <= 16'b1111111111111111;
                68:pixel_data <= 16'b1111111111111111;
                76:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                79:pixel_data <= 16'b1111111111111111;
                90:pixel_data <= 16'b1111111111111111;
                91:pixel_data <= 16'b1111111111111111;
                102:pixel_data <= 16'b1111111111111111;
                103:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            //Z
            25:begin
                //box_pixel is the pixel normalised to position of the box
                //i.e. top left is 0, bottom right is 143
                case(box_pixel)
                15:pixel_data <= 16'b1111111111111111;
                16:pixel_data <= 16'b1111111111111111;
                17:pixel_data <= 16'b1111111111111111;
                18:pixel_data <= 16'b1111111111111111;
                19:pixel_data <= 16'b1111111111111111;
                20:pixel_data <= 16'b1111111111111111;
                28:pixel_data <= 16'b1111111111111111;
                29:pixel_data <= 16'b1111111111111111;
                30:pixel_data <= 16'b1111111111111111;
                31:pixel_data <= 16'b1111111111111111;
                32:pixel_data <= 16'b1111111111111111;
                42:pixel_data <= 16'b1111111111111111;
                43:pixel_data <= 16'b1111111111111111;
                54:pixel_data <= 16'b1111111111111111;
                55:pixel_data <= 16'b1111111111111111;
                65:pixel_data <= 16'b1111111111111111;
                66:pixel_data <= 16'b1111111111111111;
                77:pixel_data <= 16'b1111111111111111;
                78:pixel_data <= 16'b1111111111111111;
                88:pixel_data <= 16'b1111111111111111;
                89:pixel_data <= 16'b1111111111111111;
                100:pixel_data <= 16'b1111111111111111;
                101:pixel_data <= 16'b1111111111111111;
                111:pixel_data <= 16'b1111111111111111;
                112:pixel_data <= 16'b1111111111111111;
                113:pixel_data <= 16'b1111111111111111;
                114:pixel_data <= 16'b1111111111111111;
                115:pixel_data <= 16'b1111111111111111;
                123:pixel_data <= 16'b1111111111111111;
                124:pixel_data <= 16'b1111111111111111;
                125:pixel_data <= 16'b1111111111111111;
                126:pixel_data <= 16'b1111111111111111;
                127:pixel_data <= 16'b1111111111111111;
                128:pixel_data <= 16'b1111111111111111;
                default:pixel_data<=0;
                endcase
            end
            default: pixel_data <= 0; //EMPTY BOX
        endcase
    end
endmodule
