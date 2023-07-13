`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2023 09:36:16
// Design Name: 
// Module Name: twenty_hz_sim
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


module twenty_hz_sim(

    );
    
    reg clock;
    wire clock_a;
    
    clk_instance dut (.clock(clock), .i(2499), .clock_out(clock_a));
    
    initial begin
            clock = 0;
    end
        
    always begin
            #5 clock <= ~clock;
    end
    
endmodule
