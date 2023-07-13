`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2023 10:52:48
// Design Name: 
// Module Name: my_clk_divider
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


module my_clk_divider(input CLOCK, output reg SLOW_CLOCK = 0, input[31:0] m);
reg [31:0] count = 0;
always @ (posedge CLOCK) begin
    count <= (count == m) ? 0 : count + 1;
    SLOW_CLOCK <= ( count == 0 ) ? ~SLOW_CLOCK : SLOW_CLOCK ;
end
endmodule
