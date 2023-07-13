`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 10:42:45
// Design Name: 
// Module Name: MorseTest
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


module MorseTest(
    input clock,
    input J_MIC_Pin3,
    input [15:0] sw,
    output J_MIC_Pin4,
    output J_MIC_Pin1,
    output reg [3:0] an = 4'b1111,
    output reg [6:0] seg = 7'b1111111,
    output reg dp = 1,
    output [7:0] JC
    );
    
    //LETTER TEST NOT DONE
    reg [4:0] letter = 0;
    //A = 0, B = 1, C = 2, D = 3, E = 4, F = 5, G = 6, H = 7, I = 8, J = 9, K = 10, L = 11, M = 12, N = 13, 
    //O = 14, P = 15, Q = 16, R = 17, S = 18, T = 19, U = 20, V = 21, W = 22, X = 23, Y = 24, Z = 25
    
    wire clk20kHz;
    clk_instance clk_20kHz (.clock(clock), .i(2499), .clock_out(clk20kHz));
    
    //INSTANTIATE COUNT DETECTOR HERE
    wire [2:0] sample_out;
    wire sample_flag;
    MorseLogic logic (.clock(clock), .clk20kHz(clk20kHz), .sw(sw), .J_MIC_Pin3(J_MIC_Pin3), .J_MIC_Pin4(J_MIC_Pin4),
    .J_MIC_Pin1(J_MIC_Pin1), .sample(sample_out), .flag(sample_flag));
    
    //**NO NUMBERS AS NUMBERS CAN GET UP TO A LENGTH OF 5
    reg [1:0] next_flag = 0;
    reg send_flag = 0;
    reg [3:0] morse_letter = 0;
    reg [4:0] length = 0;
    reg curr = 0;
    always @(posedge clk20kHz) begin
        if (sw[0]) begin
            morse_letter <= 0;
            length <= 0;
            next_flag <= 0;
        end
        else if (sw[15] && sample_flag) begin
            if (sample_out == 0 || sample_out == 1) begin
                if (sample_out == 0) begin
                    length <= length + 1;
                    morse_letter <= morse_letter << 1;
                end
                else if (sample_out == 1) begin
                    length <= length + 1;
                    morse_letter <= (morse_letter << 1) + 1;
                end
            end
            //will only be 1 for 1 clock cycle
            else begin
                if (sample_out == 2) begin
                    next_flag <= 2;
                end
                else if (sample_out == 3) begin
                    next_flag <= 3;
                end
                //Check length the clock cycle before clear
                case (length)
                    1:begin
                        case(morse_letter)
                            0: letter <= 4;  //E
                            1: letter <= 19; //T
                            default: letter <= 26; //NOT A LETTER
                        endcase
                    end
                    2:begin
                        case(morse_letter)
                            0: letter <= 8;  //I
                            1: letter <= 0;  //A
                            2: letter <= 13; //N
                            3: letter <= 12; //M
                            default: letter <= 26; //NOT A LETTER
                        endcase
                    end
                    3:begin
                        case(morse_letter)
                            0: letter <= 18; //S
                            1: letter <= 20; //U
                            2: letter <= 17; //R
                            3: letter <= 22; //W
                            4: letter <= 3;  //D
                            5: letter <= 10; //K
                            6: letter <= 6;  //G
                            7: letter <= 14; //O
                            default: letter <= 26; //NOT A LETTER
                        endcase
                    end
                    4:begin
                        case(morse_letter)
                            0: letter <= 7;   //H
                            1: letter <= 21;  //V
                            2: letter <= 5;   //F
                            //3: letter <= ;  //
                            4: letter <= 11;  //L
                            //5: letter <= ;  //
                            6: letter <= 15;  //P
                            7: letter <= 9;   //J
                            8: letter <= 1;   //B
                            9: letter <= 23;  //X
                            10: letter <= 2;  //C
                            11: letter <= 24; //Y
                            12: letter <= 25; //Z
                            13: letter <= 16; //Q
                            //14: letter <= ; //
                            //15: letter <= ; //
                            default: letter <= 26; //NOT A LETTER
                        endcase
                    end
                    default: letter <= 26;
                endcase
                morse_letter <= 0;
                length <= 0;
            end
        end
        else begin
            next_flag <= 0;
        end
        
        case(length)
            0:begin
                an <= 4'b1111;    
            end
            1:begin
                an <= 4'b1110;
                curr <= morse_letter % 2;         
            end
            2:begin
                case(an)
                    4'b1110:begin
                        an <= 4'b1101;
                        curr <= (morse_letter >> 1) % 2;
                    end
                    4'b1101:begin
                        an <= 4'b1110;
                        curr <= morse_letter % 2;
                    end
                    default: an <= 4'b1110;               
                endcase 
            end
            3:begin
                case(an)
                    4'b1110:begin
                        an <= 4'b1101;
                        curr <= (morse_letter >> 1) % 2;
                    end
                    4'b1101:begin
                        an <= 4'b1011;
                        curr <= morse_letter >> 2;
                    end
                    4'b1011:begin
                        an <= 4'b1110;
                        curr <= morse_letter % 2;
                    end
                    default: an <= 4'b1110;
                endcase             
            end
            4:begin
                case(an)
                   4'b1110:begin
                        an <= 4'b1101;
                        curr <= (morse_letter >> 1) % 2;
                    end
                    4'b1101:begin
                        an <= 4'b1011;
                        curr <= (morse_letter >> 2) % 2;
                    end
                    4'b1011:begin
                        an <= 4'b0111;
                        curr <= morse_letter >> 3;
                    end
                    4'b0111:begin
                        an <= 4'b1110;
                        curr <= morse_letter % 2;
                    end
                    default: an <= 4'b1110;             
                endcase             
            end
            default: an <= 4'b1111;
        endcase
    end
     
    always @(*) begin
        //dash
        if (curr) begin
            dp <= 1;
            seg <= 7'b0111111;
        end
        //dot
        else begin
            dp <= 0;
            seg <= 7'b1111111;
        end
    end
    
    Morse_Oled morse_oled (.clock(clock), .clk20kHz(clk20kHz), .next_flag(next_flag), .reset_flag(sw[0]), .test_flag(sw[1]),
    .morse_letter(letter), .JC(JC));
endmodule
