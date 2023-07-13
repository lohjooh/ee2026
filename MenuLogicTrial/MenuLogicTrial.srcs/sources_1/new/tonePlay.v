`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2023 09:59:17
// Design Name: 
// Module Name: tonePlay
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


module tonePlay(
    input clock,
    input clk25MHz,
    input trigger,
    input playing,
    input [11:0] frequency,
    input [11:0] duration,
    output [7:0] J,
    output reg end_flag = 0
    );
    
    wire [31:0] frequency_count;
    wire [31:0] duration_count;
    wire [31:0] flag_expected;
    reg [31:0] flag_count = 0;
    reg start = 0;
    reg initialize = 0;
    
    assign frequency_count = (50000000 / frequency) - 1;
    assign duration_count = (duration * 50000) - 1;
    assign flag_expected = ((duration + 100) * 50000) - 1;
    
    always @(posedge clk25MHz) begin
        if (trigger) begin
            if (flag_count < duration_count) begin
                start <= 1;
            end
            else start <= 0;
            if (flag_count < flag_expected) begin
                flag_count <= flag_count + 4;
            end
            else begin
                end_flag <= 1;
            end
        end
        else begin
            flag_count <= 0;
            end_flag <= 0;
            start <= 0;
        end
    end
    
    B_Task_Run tone (.clock(clock), .btnC(start), .sw(), .freq(frequency_count), .runtime(duration_count), 
    .J(J));
endmodule

