`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2023 17:16:43
// Design Name: 
// Module Name: toneSetter
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


module toneSetter(
    input clock,
    input clk20kHz,
    input clk25MHz,
    input [11:0] initial_value,
    input [2:0] mode,
    input btnC,
    input btnL,
    input btnR,
    input btnU,
    input btnD,
    output reg [6:0] seg = 7'b1111111,
    output reg dp = 1,
    output reg [3:0] an = 4'b1111,
    output reg [11:0] new_value = 0
    );
    
    reg [11:0] curr_value = 0;
    reg [3:0] num = 10;
    
    reg unclick_flag = 0;
    reg init_flag = 0;
    reg [2:0] place = 0;
    reg [17:0] debounce_count = 0;
    reg [17:0] debounce_expected = 24999;
    
    always @(posedge clk25MHz) begin
        if (mode && !init_flag) begin
            curr_value <= initial_value;
            init_flag <= 1;
        end
        else if (!mode && init_flag) begin
            init_flag <= 0;
        end
        else if (mode) begin
            if ((btnL || btnR || btnU || btnD) && !unclick_flag) begin
                if (debounce_count != debounce_expected) begin
                    debounce_count <= debounce_count + 1;
                end else begin
                    debounce_count <= 0;
                    unclick_flag <= 1;
                    if (btnL) begin
                        if (place == 3) place <= 0; 
                        else place <= place + 1;
                    end
                    else if (btnR) begin
                        if (place > 0) place <= place - 1;
                        else place <= 3;
                    end
                    else if (btnU) begin
                        if (mode == 1) begin
                            case (place)
                                0:begin
                                    if (curr_value < 4095) curr_value <= curr_value + 1;
                                end
                                1:begin
                                    if (curr_value < 4090) curr_value <= curr_value + 10;
                                    else curr_value <= 4095;
                                end
                                2:begin
                                    if (curr_value < 4000) curr_value <= curr_value + 100;
                                    else curr_value <= 4095;
                                end
                                3:begin
                                    if (curr_value < 4000) curr_value <= curr_value + 1000;
                                    else curr_value <= 4095;
                                end
                            endcase
                        end
                        else if (mode == 2) begin
                            case (place)
                                0:begin
                                    if (curr_value < 2000) curr_value <= curr_value + 1;
                                end
                                1:begin
                                    if (curr_value < 1991) curr_value <= curr_value + 10;
                                    else curr_value <= 2000;
                                end
                                2:begin
                                    if (curr_value < 1901) curr_value <= curr_value + 100;
                                    else curr_value <= 2000;
                                end
                                3:begin
                                    if (curr_value < 1001) curr_value <= curr_value + 1000;
                                    else curr_value <= 2000;
                                end
                            endcase
                        end
                    end
                    else if (btnD) begin
                        case (place)
                            0:begin
                                if (curr_value > 0) curr_value <= curr_value - 1;
                            end
                            1:begin
                                if (curr_value > 9) curr_value <= curr_value - 10;
                                else curr_value <= 0;
                            end
                            2:begin
                                if (curr_value > 99) curr_value <= curr_value - 100;
                                else curr_value <= 0;
                            end
                            3:begin
                                if (curr_value > 999) curr_value <= curr_value - 1000;
                                else curr_value <= 0;
                            end
                        endcase
                    end
                end  
            end 
            else if (!(btnL || btnR || btnU || btnD) && unclick_flag) begin
                if (debounce_count != debounce_expected) begin
                    debounce_count <= debounce_count + 1;
                end else begin
                    unclick_flag <= 0;
                    debounce_count <= 0;
                end
            end
        end
    end
    
    always @(posedge clk20kHz) begin
        if (mode == 0) begin 
            num <= 10;
            dp <= 1;
            an <= 4'b1111;
        end
        //frequency max = 9999Hz
        else if (mode == 1) begin
            dp <= 1;
            case(an)
                4'b1111:begin
                    an <= 4'b1110;
                    num <= curr_value % 10;
                end
                4'b1110:begin
                    an <= 4'b1101;
                    num <= (curr_value % 100) / 10;
                end
                4'b1101:begin
                    an <= 4'b1011;
                    num <= (curr_value % 1000) / 100;
                end
                4'b1011:begin
                    an <= 4'b0111;
                    num <= curr_value / 1000;
                end
                4'b0111:begin
                    an <= 4'b1110; 
                    num <= curr_value % 10;
                end
            endcase
        end
        //duration max = 2.000 sec
        else if (mode == 2) begin
             case(an)
                4'b1111:begin
                    an <= 4'b1110;
                    dp <= 1;
                    num <= curr_value % 10;
                end
                4'b1110:begin
                    an <= 4'b1101;
                    dp <= 1;
                    num <= (curr_value % 100) / 10;
                end
                4'b1101:begin
                    an <= 4'b1011;
                    dp <= 1;
                    num <= (curr_value % 1000) / 100;
                end
                4'b1011:begin
                    an <= 4'b0111;
                    dp <= 0;
                    num <= curr_value / 1000;
                end
                4'b0111:begin
                    an <= 4'b1110; 
                    dp <= 1;
                    num <= curr_value % 10;
                end
            endcase
        end  
    end
    
    always @(curr_value) begin
        if (mode) new_value <= curr_value;
        else new_value <= initial_value;
    end
    
    always @(*) begin
        case(num)
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
    
endmodule

