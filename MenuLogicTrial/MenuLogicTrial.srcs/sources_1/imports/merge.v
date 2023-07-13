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


module merge(input CLOCK,input [10:0] pixel_index, output reg [15:0] oled_pixel = 0);

always@(posedge CLOCK) begin
oled_pixel <= 0;
end
endmodule