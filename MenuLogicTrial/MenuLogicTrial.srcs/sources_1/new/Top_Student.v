`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT A NAME: 
//  STUDENT B NAME: Loh Joo Hoe
//  STUDENT C NAME: 
//  STUDENT D NAME:  
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    //JOOHOES CODE
    input clock,
    //input btnC,
    input [15:0] sw,
    output [7:0] JXADC,
    output [6:0] seg,
    output [3:0] an,
    output dp,
    // KEDRIANS CODE
    input J_MIC_Pin3,
    output J_MIC_Pin4,
    output J_MIC_Pin1,
    output [12:0] led,
    output reg [15:13] leds = 0,
    //
    output [7:0]JC,
    input left, right, middle,
    input [11:0] xpos,ypos
    );  
    
    //wire [11:0]xpos; wire [11:0]ypos; reg [11:0]ypos_adjusted;
    //reg middle_pressed = 0;

    wire [12:0] pixel_index; 
    wire [8:0] x, y;   
    Pixel_toXY pixel_XY(pixel_index, x, y);
    
    wire clock_LED;
    clk_instance clk_6p25khz(.clock(clock), .i(7), .clock_out(clock_LED));
    
    wire frame_begin;
    wire sending_pixels;
    wire sample_pixel;
    reg [15:0]oled_data = 16'b1111100000000000;
    Oled_Display unit_my_OLED (.clk(clock_LED), .reset(0), .frame_begin(frame_begin), 
    .sending_pixels(sending_pixels), .sample_pixel(sample_pixel), .pixel_index(pixel_index),
    .pixel_data(oled_data), .cs(JC[0]), .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), 
    .vccen(JC[6]), .pmoden(JC[7]));
    
    wire [15:0] oled_number;
    wire [5:0] six_side;
    wire [6:0] ledseg;
    wire [3:0] drawn;
    wire valid_flag;
    //wire left, right, middle;
    Group_seven_seg makenum(clock, x, y, oled_number, six_side, ledseg, drawn, valid_flag, 
    left, right, middle, sw[15], xpos, ypos);    
    
    Oled_Switch_Number switch(clock, sw, six_side, ledseg);
    
    always @(posedge clock) begin
        if (x >= 57 && x <= 59 && y <= 59 && sw[14] == 0) 
        begin
            oled_data <= 16'h07E0;
        end
        else if (y >= 57 && y <= 59 && x <= 59 && sw[14] == 0)
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
    
    always @ (posedge clock) begin
        leds[13] <= (right == 1) ? 1 : 0;    
        leds[14] <= (middle == 1) ? 1 : 0;
        leds[15] <= valid_flag;
    end
    
    wire clock_20kHz;
    clk_instance clk_20khz(.clock(clock), .i(2499), .clock_out(clock_20kHz));
    
    wire [3:0] number_volume;
    reg [3:0] volume = 0;
    reg [31:0] peak_value = 0;
    find_volume_level vol (peak_value, clock_20kHz, number_volume);
    
    wire[11:0] MIC_in;
    Audio_Input unit_my_audio_input (.CLK(clock), .cs(clock_20kHz), .MISO(J_MIC_Pin3), .clk_samp(J_MIC_Pin1),             
    .sclk(J_MIC_Pin4), .sample(MIC_in));
    
    //1 sec, 190Hz
    // B_Task_Run individual_task (.clock(clock), .btnC(btnC), .sw(sw[13]), .freq(263157), .runtime(99999999), 
    //.J(JXADC));
    
    reg [31:0] count_per_input = 0;
    always @ (posedge clock_20kHz)
        begin
        // 4000 means regular time interval of 0.2 seconds
        count_per_input <= (count_per_input == 4000)? 0 : count_per_input + 1;
        if (MIC_in > peak_value)
        begin
            peak_value <= MIC_in;
        end
        if (count_per_input == 0)
        begin
            peak_value <= 0;
            volume <= number_volume;
        end
    end
    
    wire [31:0] runtime;
    assign runtime = 5000000 * (drawn + 1);
    B_Task_Run group_task (.clock(clock), .btnC(valid_flag), .sw(sw[13]), .freq(263157), .runtime(runtime),
    .J(JXADC));
    
    Group_Task_7Seg(.clock(clock), .number_drawn(drawn), .number_volume(volume), .valid_flag(valid_flag), 
    .seg(seg), .an(an), .dp(dp), .led(led[8:0]));
    
endmodule