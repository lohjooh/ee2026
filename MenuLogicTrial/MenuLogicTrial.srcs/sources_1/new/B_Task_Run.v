module B_Task_Run (
    input clock,
    input btnC,
    input sw,
    input [31:0]freq,
    input [31:0]runtime,
    output [7:0] J
    );
    
    wire clk50M;
    wire clk20K;
    clk_instance clock_50M (.clock(clock), .i(1), .clock_out(clk50M));
    clk_instance clock_20k (.clock(clock), .i(2499), .clock_out(clk20K));
    
    wire [31:0] twof;
    assign twof = freq >> 1; //Double frequency = half period
    wire clkf;
    wire clktf;    
    clk_instance clock_f (.clock(clock), .i(freq), .clock_out(clkf));
    clk_instance clock_tf (.clock(clock), .i(twof), .clock_out(clktf));

    wire beep_flag;
    B_Task beep (.clock(clock), .btnC(btnC), .expected(runtime), .beep_flag(beep_flag));
    
    parameter [11:0] max_vol = 12'hFFF;
    parameter [11:0] half_vol = 12'h800;
    reg [11:0] audio_out;
    
    always @(posedge clock) begin
        if (beep_flag) begin
            audio_out <= sw ? (clkf ? max_vol : 0) : (clktf ? half_vol : 0);
        end else audio_out <= 0;
    end

    Audio_Output DAC2 (.CLK(clk50M), .START(clk20K), .DATA1(audio_out), .D1(J[1]), .D2(J[2]), .CLK_OUT(J[3]), .nSYNC(J[0]));
    
endmodule