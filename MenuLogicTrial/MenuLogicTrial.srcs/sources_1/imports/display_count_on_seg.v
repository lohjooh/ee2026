`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2023 15:53:13
// Design Name: 
// Module Name: display_count_on_seg
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


module display_count_on_seg(input [15:0] correct_count, input clock, output reg [7:0] seg,
 output reg [3:0] an, input out_word_flag);
reg [11:0] thousandth;
reg [9:0] hundredth;
reg [7:0] tenth;
reg [3:0] oneth;
reg [2:0]flag = 0;
always @ (posedge clock) begin
    flag = (flag == 4) ? 0 : flag + 1;
    if (out_word_flag == 0) begin
        oneth = correct_count % 10;
        tenth = correct_count % 100;
        hundredth = correct_count % 1000;
        thousandth = correct_count % 10000;
        if (flag == 0) begin
            if (oneth == 4'd0) begin
                an <= 4'b1110;
                seg <= 8'b11000000; 
            end else if (oneth == 4'd1) begin
                an <= 4'b1110;
                seg <= 8'b11111001;
            end else if (oneth == 4'd2) begin
                an <= 4'b1110;
                seg <= 8'b10100100;
            end else if (oneth == 4'd3) begin
                an <= 4'b1110;
                seg <= 8'b10110000;
            end else if (oneth == 4'd4) begin
                an <= 4'b1110;
                seg <= 8'b10011001;
            end else if (oneth == 4'd5) begin
                an <= 4'b1110;
                seg <= 8'b10010010;
            end else if (oneth == 4'd6) begin
                an <= 4'b1110;
                seg <= 8'b10000010;
            end else if (oneth == 4'd7) begin
                an <= 4'b1110;
                seg <= 8'b11111000;
            end else if (oneth == 4'd8) begin
                an <= 4'b1110;
                seg <= 8'b10000000;
            end else if (oneth == 4'd9) begin
                an <= 4'b1110;
                seg <= 8'b10010000;
            end 
        end else if (flag == 2) begin
            if (tenth < 10) begin
                an <= 4'b1101;
                seg <= 8'b11000000;
            end else if (tenth < 20) begin
                an <= 4'b1101;
                seg <= 8'b11111001;
            end else if (tenth < 30) begin
                an <= 4'b1101;
                seg <= 8'b10100100;
            end else if (tenth < 40) begin
                an <= 4'b1101;
                seg <= 8'b10110000;
            end else if (tenth < 50) begin
                an <= 4'b1101;
                seg <= 8'b10011001;
            end else if (tenth < 60) begin
                an <= 4'b1101;
                seg <= 8'b10010010;
            end else if (tenth < 70) begin
                an <= 4'b1101;
                seg <= 8'b10000010;
            end else if (tenth < 80) begin
                an <= 4'b1101;
                seg <= 8'b11111000;
            end else if (tenth < 90) begin
                an <= 4'b1101;
                seg <= 8'b10000000;
            end else if (tenth < 100) begin
                an <= 4'b1101;
                seg <= 8'b10010000;
            end        
        end else if (flag == 3) begin
            if (hundredth < 100) begin
                an <= 4'b1011;
                seg <= 8'b11000000;
            end else if (hundredth < 200) begin
                an <= 4'b1011;
                seg <= 8'b11111001;
            end else if (hundredth < 300) begin
                an <= 4'b1011;
                seg <= 8'b10100100;
            end else if (hundredth < 400) begin
                an <= 4'b1011;
                seg <= 8'b10110000;
            end else if (hundredth < 500) begin
                an <= 4'b1011;
                seg <= 8'b10011001;
            end else if (hundredth < 600) begin
                an <= 4'b1011;
                seg <= 8'b10010010;
            end else if (hundredth < 700) begin
                an <= 4'b1011;
                seg <= 8'b10000010;
            end else if (hundredth < 800) begin
                an <= 4'b1011;
                seg <= 8'b11111000;
            end else if (hundredth < 900) begin
                an <= 4'b1011;
                seg <= 8'b10000000;
            end else if (hundredth < 1000) begin
                an <= 4'b1011;
                seg <= 8'b10010000;
            end           
        end else if (flag == 4) begin
            if (thousandth < 1000) begin
                an <= 4'b0111;
                seg <= 8'b11000000;
            end else if (thousandth < 2000) begin
                an <= 4'b0111;
                seg <= 8'b11111001;
            end else if (thousandth < 3000) begin
                an <= 4'b0111;
                seg <= 8'b10100100;
            end else if (thousandth < 4000) begin
                an <= 4'b0111;
                seg <= 8'b10110000;
            end else if (thousandth < 5000) begin
                an <= 4'b0111;
                seg <= 8'b10011001;
            end else if (thousandth < 6000) begin
                an <= 4'b0111;
                seg <= 8'b10010010;
            end else if (thousandth < 7000) begin
                an <= 4'b0111;
                seg <= 8'b10000010;
            end else if (thousandth < 8000) begin
                an <= 4'b0111;
                seg <= 8'b11111000;
            end else if (thousandth < 9000) begin
                an <= 4'b0111;
                seg <= 8'b10000000;
            end else if (thousandth < 10000) begin
                an <= 4'b0111;
                seg <= 8'b10010000;
            end           
        end 
    end else if (out_word_flag == 1) begin
        if (flag == 0) begin
            an <= 4'b1110;      
            seg <= 8'b11000111;  
        end else if (flag == 1) begin
            an <= 4'b1101;
            seg <= 8'b11001111;
        end else if (flag == 2) begin
            an <= 4'b1011;
            seg <= 8'b10001000;
        end else if (flag == 3) begin
            an <= 4'b0111;
            seg <= 8'b10001110; 
        end
    end
end

endmodule
