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
/*

*/
module kedrian(input basys_clock, input J_MIC_Pin3, input sw0, sw14, sw15,
output reg led10, led11, led12, output J_MIC_Pin4 ,output J_MIC_Pin1, output reg [8:0]led = 9'd0, 
output reg [7:0]seg = 8'b11000000, output reg [3:0]an = 4'b0000);
    reg [15:0] amplitude_database [0:99];
    reg [15:0] amplitude_to_compare [0:99];
    reg [15:0] amplitude_difference;
    
    parameter THRESHOLD = 90;
    parameter MINIMUM_NOISE = 2075;
    
    reg [9:0] index_sw15 = 0;
    reg [9:0] index_sw14 = 0;
    reg [9:0] compare_index_amp_db = 0;
    reg [9:0] compare_index_amp_in = 0;
    reg [15:0] correct_count = 0;
    reg [15:0] correct_count_max = 100;
    reg [15:0] correct_percentage = 0;    
    reg [15:0] white_noise_db = 0;
    reg [15:0] white_noise_input = 0;
    reg [15:0] white_noise_count = 0;
    reg out_word_flag = 0;
    wire[11:0] MIC_in;

    wire clock_20kHz;
    my_clk_divider unit_2(basys_clock, clock_20kHz, 2499);
    
    wire clock_5Hz;
    my_clk_divider unit_0(basys_clock, clock_5Hz, 10000000);
    
    wire clock_50Hz;
    my_clk_divider unit_4(basys_clock, clock_50Hz, 1000000);
    
    wire clock_500Hz;
    my_clk_divider unit_3(basys_clock, clock_500Hz, 100000);
    
    wire [7:0]seg_display; wire [3:0]an_display;
    display_count_on_seg unit_5(correct_percentage, clock_500Hz, seg_display, an_display, out_word_flag);
    
    Audio_Input unit_my_audio_input (
         .CLK(basys_clock),                 // 100MHz clock
         .cs(clock_20kHz),                  // sampling clock, 20kHz
         .MISO(J_MIC_Pin3),                 // J_MIC3_Pin3, serial mic input
         .clk_samp(J_MIC_Pin1),             // J_MIC3_Pin1
         .sclk(J_MIC_Pin4),                 // J_MIC3_Pin4, MIC3 serial clock
         .sample(MIC_in)                    // 12-bit audio sample data
        );
    
    
    always @ (posedge clock_500Hz) begin
        seg <= seg_display;
        an <= an_display;
    end
    
    // every 0.02 seconds, track amplitude and frequency once
    always @ (posedge clock_50Hz) begin

    if (sw15 == 1 && index_sw15 < 100) begin          // reading in amplitudes for database
        amplitude_database[index_sw15] <= MIC_in;
        if (MIC_in < MINIMUM_NOISE) begin
            white_noise_db = white_noise_db + 1;
        end
        led[0] <= 1;
        index_sw15 <= index_sw15 + 1;
        
    end else if (sw14 == 1 && index_sw14 < 100 && index_sw15 == 100) begin  // reading in amplitudes to compare
    
        amplitude_to_compare[index_sw14] <= MIC_in;
        if (MIC_in < MINIMUM_NOISE) begin
            white_noise_input = white_noise_input + 1;
        end
        led[1] <= 1;
        index_sw14 <= index_sw14 + 1;
        
    end
    
    // Will take longer than 2 seconds to finish comparing everything
    if (index_sw14 == 100 && compare_index_amp_db < 100 && compare_index_amp_in < 100) begin
    
        if (amplitude_database[compare_index_amp_db] < MINIMUM_NOISE) begin
        
            compare_index_amp_db <= compare_index_amp_db + 1;
            
        end else if (amplitude_to_compare[compare_index_amp_in] < MINIMUM_NOISE) begin
        
            compare_index_amp_in <= compare_index_amp_in + 1;
            
        end else begin
        
            amplitude_difference = (amplitude_database[compare_index_amp_db] > amplitude_to_compare[compare_index_amp_in]) ?
            amplitude_database[compare_index_amp_db] - amplitude_to_compare[compare_index_amp_in] : amplitude_to_compare[compare_index_amp_in] - amplitude_database[compare_index_amp_db];
            
            if (amplitude_difference < THRESHOLD) begin
                correct_count <= correct_count + 1;
            end
            
            compare_index_amp_db <= compare_index_amp_db + 1;   
            compare_index_amp_in <= compare_index_amp_in + 1;   
            
        end
    end    
    
    white_noise_count = (white_noise_db < white_noise_input) ? white_noise_db : white_noise_input;
    if (white_noise_count < 100) begin
        correct_percentage = ( (correct_count * 100) / (100 - white_noise_count) );
        out_word_flag <= 0;
    end else if (white_noise_count == 100) begin
        out_word_flag <= 1;
    end
    if (index_sw15 == 100) begin
        led[4] <= 1;
    end
    
    if (index_sw14 == 100) begin
        led[5] <= 1;
    end
    
    if (sw0 == 1) begin
        index_sw15 <= 0;
        index_sw14 <= 0;
        compare_index_amp_db <= 0;
        compare_index_amp_in <= 0;
        correct_count <= 0;
        correct_count_max <= 100;
        correct_percentage <= 0;
        white_noise_count <= 0;
        white_noise_db <= 0;
        white_noise_input <= 0;
        out_word_flag = 0;
        led <= 9'd0;
    end

    end // end for always @ block

endmodule
