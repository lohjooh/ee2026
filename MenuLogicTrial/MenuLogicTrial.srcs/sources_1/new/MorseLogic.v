`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2023 13:14:56
// Design Name: 
// Module Name: MorseLogic
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


module MorseLogic(
    input clock,
    input clk20kHz,
    input [15:0] sw,
    input J_MIC_Pin3,
    output J_MIC_Pin4,
    output J_MIC_Pin1,
    output reg [1:0] sample = 0,
    output reg flag = 0
    );
    
    reg initial_flag = 0;
    parameter [11:0] threshold = 2150;
    parameter [11:0] is_one = 280;
    reg [11:0] count = 0;
    reg [11:0] expected = 1000;
    reg [31:0] sample_count = 0;
    reg [3:0] sample_index = 0;
    
    reg [6:0] current_sample = 0;
//    wire clk20kHz;
//    clk_instance clk_20khz (.clock(clock), .i(2499), .clock_out(clk20kHz));
    
    wire[11:0] MIC_in;
    Audio_Input unit_my_audio_input (.CLK(clock), .cs(clk20kHz), .MISO(J_MIC_Pin3), .clk_samp(J_MIC_Pin1),             
    .sclk(J_MIC_Pin4), .sample(MIC_in));
    
    always @(posedge clk20kHz) begin
        if (sw[0]) begin
            sample_index <= 0;
            current_sample <= 0;
            count <= 0;
            initial_flag <= 0;
            sample <= 0;
            flag <= 0;
        end
        else begin
            if (sw[15]) begin
                if (count != expected) begin
                    if (MIC_in >= threshold) begin
                        sample_count <= sample_count + 1;
                        initial_flag <= 1;
                    end
                    if (initial_flag) count <= count + 1;
                    
                    if (sample_index > 6) begin
                        //Check if next word
                        if (current_sample == 7'b0) begin
                           flag <= 1;
                           sample_index <= 0;
                           sample <= 3;
                        end
                        //Else error
                        else begin
                            flag <= 0;
                            current_sample <= 0;
                            sample_index <= 0;
                        end                
                    end
                    else if (sample_index > 3) begin
                        //If dash
                        if (current_sample == 7'b0001110) begin
                            flag <= 1;
                            sample_index <= 0;
                            current_sample <= 0;
                            sample <= 1;
                        end
                        //If next letter
                        else if (current_sample == 7'b0000001) begin
                            flag <= 1;
                            sample_index <= 1;
                            current_sample <= 1;
                            sample <= 2;
                        end
                    end
                    else if (sample_index > 1) begin
                        //If dot
                        if (current_sample == 7'b0000010) begin
                            flag <= 1;
                            sample_index <= 0;
                            current_sample <= 0;
                            sample <= 0;
                        end
                        //Error
                        else if (current_sample == 7'b0000001) begin
                            flag <= 0;
                            sample_index <= 1;
                            current_sample <= 1;
                        end
                    end
                    else flag <= 0;
                end
                else begin
                    if (sample_count >= is_one) begin
                        current_sample <= (current_sample << 1) + 1;
                        sample_index <= sample_index + 1;
                    end 
                    else begin
                        current_sample <= current_sample << 1;
                        sample_index <= sample_index + 1;
                    end
                    sample_count <= 0;
                    count <= 0;
                end
            end
        end
    end
    
endmodule
