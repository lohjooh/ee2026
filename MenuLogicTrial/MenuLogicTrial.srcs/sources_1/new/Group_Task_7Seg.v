`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 20:14:16
// Design Name: 
// Module Name: Group_Task_7Seg
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


module Group_Task_7Seg(
    input clock,
    input [3:0] number_drawn,
    input [3:0] number_volume,
    input valid_flag,
    output reg [6:0] seg = 7'b1111111,
    output reg [3:0] an = 4'b1111,
    output reg dp = 1,
    output reg [8:0] led = 0
    );
    
    reg [3:0] curr_number = 10;
    reg [3:0] number_0 = 0;
    reg [3:0] number_1 = 0;
    wire clk80kHz;
    clk_instance clk_80kHz(.clock(clock), .i(624), .clock_out(clk80kHz));
    
    always @(posedge clk80kHz) begin
        if (valid_flag) begin
            case(an)
                4'b1111:begin
                an <= 4'b1110;
                dp <= 1;
                curr_number <= number_volume;
                end
                4'b1110:begin
                an <= 4'b1011;
                dp <= 1;
                curr_number <= number_1;
                end
                4'b1011:begin
                an <= 4'b0111;
                dp <= 0;
                curr_number <= number_0;
                end
                4'b0111:begin
                an <= 4'b1110;
                dp <= 1;
                curr_number <= number_volume;
                end
            endcase
        end else begin
            an <= 4'b1110;
            dp <= 1;
            curr_number <= number_volume;
        end
    end
    
    always @(number_volume) begin
        case(number_volume)
            0:begin
                led <= 0;
            end
            1:begin
                led[0] = 1;
                led[8:1] = 0;
            end
            2:begin
                led[1:0] = 2'b11;
                led[8:2] = 0;
            end
            3:begin
                led[2:0] = 3'b111;
                led[8:3] = 0;
            end
            4:begin
                led[3:0] = 4'b1111;
                led[8:4] = 0;
            end
            5:begin
                led[4:0] = 5'b11111;
                led[8:5] = 0;
            end
            6:begin
                led[5:0] = 6'b111111;
                led[8:6] = 0;
            end
            7:begin
                led[6:0] = 7'b1111111;
                led[8:7] = 0;
            end
            8:begin
                led[7:0] = 8'b11111111;
                led[8] = 0;
            end
            9:begin
                led[8:0] = 9'b111111111;
            end
            default:begin
                led <= 0;
            end
        endcase
    end
    
    always @(*) begin
        case(curr_number)
            0:begin
                seg <= 7'b1000000;
            end
            1:begin
                seg <= 7'b1111001;
            end
            2:begin
                seg <= 7'b0100100;
            end
            3:begin
                seg <= 7'b0110000;
            end
            4:begin
                seg <= 7'b0011001;
            end
            5:begin
                seg <= 7'b0010010;
            end
            6:begin
                seg <= 7'b0000010;
            end
            7:begin
                seg <= 7'b1111000;
            end
            8:begin
                seg <= 7'b0000000;
            end
            9:begin
                seg <= 7'b0010000;
            end
            default:begin
                seg <= 7'b1111111;
            end
        endcase
    end
   
    always @(*) begin
        case(number_drawn)
            0:begin
                number_0 <= 0;
                number_1 <= 1;
            end
            1:begin
                number_0 <= 0;
                number_1 <= 2;
            end
            2:begin
                number_0 <= 0;
                number_1 <= 3;
            end
            3:begin
                number_0 <= 0;
                number_1 <= 4;
            end
            4:begin
                number_0 <= 0;
                number_1 <= 5;
            end
            5:begin
                number_0 <= 0;
                number_1 <= 6;
            end
            6:begin
                number_0 <= 0;
                number_1 <= 7;
            end
            7:begin
                number_0 <= 0;
                number_1 <= 8;
            end
            8:begin
                number_0 <= 0;
                number_1 <= 9;
            end
            9:begin
                number_0 <= 1;
                number_1 <= 0;
            end
            default:begin
                number_0 <= 0;
                number_1 <= 1;
            end
        endcase
    end
    
endmodule
