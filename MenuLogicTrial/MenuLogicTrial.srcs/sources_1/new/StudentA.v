`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 03:00:30
// Design Name: 
// Module Name: StudentA
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

module StudentA (input basys_clock, input J_MIC_Pin3, input sw1,
output J_MIC_Pin4 ,output J_MIC_Pin1, output reg [8:0]led, output reg [7:0]seg, output reg [3:0]an = 4'b1110);
reg [31:0] count_per_input = 0;
reg [31:0] peak_value = 0;
wire[11:0] MIC_in;

wire clock_20kHz;
my_clk_divider unit_0(basys_clock, clock_20kHz, 2499);

wire [3:0] vol_lvl;
find_volume_level unit_2(peak_value, clock_20kHz, vol_lvl);

wire [7:0]seg_vol_display; wire [3:0]an_vol_display; wire [8:0]led_vol_display;
display_seg_an_led unit_3(vol_lvl,clock_20kHz, seg_vol_display, an_vol_display, led_vol_display);

Audio_Input unit_my_audio_input (
     .CLK(basys_clock),                 // 100MHz clock
     .cs(clock_20kHz),                  // sampling clock, 20kHz
     .MISO(J_MIC_Pin3),                 // J_MIC3_Pin3, serial mic input
     .clk_samp(J_MIC_Pin1),             // J_MIC3_Pin1
     .sclk(J_MIC_Pin4),                 // J_MIC3_Pin4, MIC3 serial clock
     .sample(MIC_in)                    // 12-bit audio sample data
    );

always @ (posedge clock_20kHz)
begin
// 4000 means regular time interval of 0.2 seconds
count_per_input <= (count_per_input == 4000)? 0 : count_per_input + 1;
if (MIC_in > peak_value)
    begin
    peak_value <= MIC_in;
    end
if (count_per_input == 0)
    begin
    led <= led_vol_display;
    seg <= seg_vol_display;
    an <= an_vol_display;
    peak_value <= 0;
    end
end

endmodule