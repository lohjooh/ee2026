`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2023 10:27:58
// Design Name: 
// Module Name: clk_instance
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


module clk_instance(
    input clock,
    input [31:0] i,
    output reg clock_out = 0
    );
    
    reg [26:0] count = 0;
    
    always @(posedge clock) begin
        count <= (count == i || count > i) ? 0 : count + 1;
        clock_out <= (count == 0) ? ~clock_out : clock_out;
    end
endmodule
