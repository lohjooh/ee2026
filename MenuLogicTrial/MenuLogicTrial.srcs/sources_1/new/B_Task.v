`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2023 13:30:37
// Design Name: 
// Module Name: B_Task
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


module B_Task(
    input clock,
    input btnC,
    input [31:0] expected,
    output reg beep_flag = 0
    );
    
    reg [31:0] count = 0;
    reg [31:0] debounce_count = 0;
    reg [31:0] debounce_expected = 99999;
    reg run_flag = 0;
    reg unclick_flag = 0;
    
    always @(posedge clock) begin
        if (btnC && !unclick_flag && debounce_count != debounce_expected) begin
            debounce_count <= debounce_count + 1;
        end else if (btnC && !unclick_flag && debounce_count == debounce_expected) begin
            run_flag <= 1;
            unclick_flag <= 1;
            debounce_count <= 0;
        end else if (!btnC && unclick_flag && debounce_count != debounce_expected) begin
            debounce_count <= debounce_count + 1;
        end else if (!btnC && unclick_flag && debounce_count == debounce_expected) begin
           unclick_flag <= 0;
           debounce_count <= 0;  
        end else 
           debounce_count <= 0;      
        if (run_flag) begin
            if (count != expected) begin
                count <= count + 1;
                beep_flag <= 1;
             end else begin
                run_flag <= 0;
                count <= 0;
                beep_flag <= 0;
             end
        end
    end
    
endmodule
