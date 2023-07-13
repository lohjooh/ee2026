`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 16:06:15
// Design Name: 
// Module Name: StudentB
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


module StudentB(
    input clock,
    input sw,
    input btnC,
    output [7:0] JXADC
    );
    
    //1 sec, 190Hz
     B_Task_Run individual_task (.clock(clock), .btnC(btnC), .sw(sw), .freq(263157), .runtime(99999999), 
    .J(JXADC));
    
endmodule
