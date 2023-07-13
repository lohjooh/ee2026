`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2023 21:28:36
// Design Name: 
// Module Name: toneMenu
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

module toneMenu(
    input clock,
    input btnC,
    input btnL,
    input btnR,
    input btnU,
    input btnD,
    input [15:0] sw,
    output reg [6:0] seg = 7'b1111111,
    output reg dp = 1,
    output reg [3:0] an = 4'b1111,
    output [7:0] JXADC,
    output reg [15:0] led = 0
    );
    
    wire clk20kHz;
    clk_instance clk_20kHz(.clock(clock), .i(2499), .clock_out(clk20kHz));
    wire clk25MHz;
    clk_instance clk_25MHz (.clock(clock), .i(1), .clock_out(clk25MHz));
    wire clk0p8s;
    clk_instance clk_0p4s(.clock(clock), .i(39999999), .clock_out(clk0p8s));
    
    reg [12:0] frequency [15:0];
    reg [12:0] duration [15:0];
    
    integer i;
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            frequency[i] <= 0;
            duration[i] <= 0;
        end
    end
    
    reg [4:0] menu = 0;
    wire [6:0] set_seg;
    wire set_dp;
    wire [3:0] set_an;
    wire [11:0] set_out;
    reg [11:0] set_change = 0;
    reg [2:0] set_mode = 0;
    toneSetter ts (.clock(clock), .initial_value(set_change), .mode(set_mode), .btnC(btnC), .btnL(btnL), .btnR(btnR),
    .btnU(btnU), .btnD(btnD), .seg(set_seg), .dp(set_dp), .an(set_an), .new_value(set_out), .clk20kHz(clk20kHz)
    , .clk25MHz(clk25MHz));
    
    reg [3:0] state = 0;
    reg [6:0] seg0 = 7'b1111111;
    reg [6:0] seg1 = 7'b1111111;
    reg [6:0] seg2 = 7'b1111111;
    reg [6:0] seg3 = 7'b1111111;
    
    reg [4:0] edit = 16;
    always @(sw) begin
        if (!sw) edit <= 16;
        else if (sw[15]) edit <= 15;
        else if (sw[14]) edit <= 14;
        else if (sw[13]) edit <= 13;
        else if (sw[12]) edit <= 12;
        else if (sw[11]) edit <= 11;
        else if (sw[10]) edit <= 10;
        else if (sw[9]) edit <= 9;
        else if (sw[8]) edit <= 8;
        else if (sw[7]) edit <= 7;
        else if (sw[6]) edit <= 6;
        else if (sw[5]) edit <= 5;
        else if (sw[4]) edit <= 4;
        else if (sw[3]) edit <= 3;
        else if (sw[2]) edit <= 2;
        else if (sw[1]) edit <= 1;
        else if (sw[0]) edit <= 0;
    end
    
    always @(posedge clk20kHz) begin
        if (menu < 5) begin
            dp <= 1;
            case(an)
                4'b1111:begin
                    an <= 4'b1110;
                    seg <= seg0;    
                end
                4'b1110:begin
                    an <= 4'b1101;
                    seg <= seg1;    
                end
                4'b1101:begin
                    an <= 4'b1011;
                    seg <= seg2;
                end
                4'b1011:begin
                    an <= 4'b0111;
                    seg <= seg3;    
                end
                4'b0111:begin
                    an <= 4'b1110;
                    seg <= seg0; 
                end
                default:begin
                    an <= 4'b1111;
                    seg <= seg0;
                end
            endcase
        end
        else begin
            if (edit != 16) begin
                an <= set_an;
                dp <= set_dp;
                seg <= set_seg;
            end
        end       
    end
    
        parameter [6:0] P = 7'b0001100;
        parameter [6:0] L = 7'b1000111;
        parameter [6:0] A = 7'b0001000;
        parameter [6:0] Y = 7'b0010001;
        parameter [6:0] S = 7'b0010010;
        parameter [6:0] E = 7'b0000110;
        parameter [6:0] T = 7'b1001110;
        parameter [6:0] U = 7'b1000001;
        parameter [6:0] F = 7'b0001110;
        parameter [6:0] R = 7'b0000100;
        parameter [6:0] Q = 7'b0010100;
        parameter [6:0] C = 7'b1000110;
        parameter [6:0] N = 7'b1001000;
        parameter [6:0] B = 7'b0000000;
        parameter [6:0] K = 7'b0001010;
        parameter [6:0] D = 7'b1100000;
        parameter [6:0] I = 7'b1001111;
        parameter [6:0] O = 7'b1000000;
    
    always @(*) begin
        if (menu == 0) begin
            case (state)
                0:begin
                    seg3 <= P; //  P
                    seg2 <= L; //  L
                    seg1 <= A; //  A
                    seg0 <= Y; //  Y
                end
            endcase
        end
        else if (menu == 1) begin
            case (state)
                0:begin
                    seg3 <= S; //  S
                    seg2 <= E; //  E
                    seg1 <= T; //  T
                    seg0 <= U; //  U
                end
                1:begin
                    seg3 <= E; //  E
                    seg2 <= T; //  T
                    seg1 <= U; //  U
                    seg0 <= P; //  P
                end
            endcase
        end
        else if (menu == 2) begin
            case (state)
                0:begin
                    seg3 <= F; //  F
                    seg2 <= R; //  R
                    seg1 <= E; //  E
                    seg0 <= Q; //  Q
                end
                1:begin
                    seg3 <= R; //  R
                    seg2 <= E; //  E
                    seg1 <= Q; //  Q
                    seg0 <= U; //  U
                end
                2:begin
                    seg3 <= E; //  E
                    seg2 <= Q; //  Q
                    seg1 <= U; //  U
                    seg0 <= E; //  E
                end
                3:begin
                    seg3 <= Q; //  Q
                    seg2 <= U; //  U
                    seg1 <= E; //  E
                    seg0 <= N; //  N
                end
                4:begin
                    seg3 <= U; //  U
                    seg2 <= E; //  E
                    seg1 <= N; //  N
                    seg0 <= C; //  C
                end
                5:begin
                    seg3 <= E; //  E
                    seg2 <= N; //  N
                    seg1 <= C; //  C
                    seg0 <= Y; //  Y
                end
            endcase
        end
        else if (menu == 3) begin
            case (state)
                0:begin
                    seg3 <= D; //  T
                    seg2 <= U; //  I
                    seg1 <= R; //  M
                    seg0 <= A; //  E
                end
                1:begin
                    seg3 <= U; //  T
                    seg2 <= R; //  I
                    seg1 <= A; //  M
                    seg0 <= T; //  E
                end
                2:begin
                    seg3 <= R; //  T
                    seg2 <= A; //  I
                    seg1 <= T; //  M
                    seg0 <= I; //  E
                end
                2:begin
                    seg3 <= A; //  T
                    seg2 <= T; //  I
                    seg1 <= I; //  M
                    seg0 <= O; //  E
                end
                3:begin
                    seg3 <= T; //  T
                    seg2 <= I; //  I
                    seg1 <= O; //  M
                    seg0 <= N; //  E
                end
            endcase
        end
        else if (menu == 4) begin
            case (state)
                0:begin
                    seg3 <= B; //  B
                    seg2 <= A; //  A
                    seg1 <= C; //  C
                    seg0 <= K; //  K
                end
            endcase
        end
    end
    
    always @(posedge clk0p8s) begin
        if (menu == 0) begin
            state <= 0;
        end
        else if (menu == 1) begin
            case (state)
                0: state <= 1;
                1: state <= 0;
            endcase
        end
        else if (menu == 2) begin
            case (state)
                5: state <= 0;
                default:begin
                    if (state > 5) state <= 0;
                    else state <= state + 1;
                end
            endcase
        end
        else if (menu == 3) begin
            case (state)
                3: state <= 0;
                default:begin
                    if (state > 3) state <= 0;
                    else state <= state + 1;
                end
            endcase
        end
        else if (menu == 4) begin
            state <= 0;
        end
    end
    
    reg [17:0] debounce_count = 0;
    reg [17:0] debounce_expected = 24999;
    reg unclick_flag = 0;
    wire end_flag;
    reg playing = 0;
    reg [4:0] playing_curr = 15;
    reg [11:0] playing_freq = 0;
    reg [11:0] playing_dur = 0;
    reg trigger = 0;
    always @(posedge clk25MHz) begin
        if ((btnC || btnU || btnD) && !unclick_flag) begin
            if (debounce_count != debounce_expected) begin
                debounce_count <= debounce_count + 1;
            end else begin
                debounce_count <= 0;
                unclick_flag <= 1;
                if (btnC) begin
                    case (menu)
                        0:  playing <= ~playing;
                        1:  menu <= 2;
                        2:  menu <= 5;
                        3:  menu <= 6;
                        4:  menu <= 0;
                    endcase
                end
                else if (btnU) begin
                    case (menu)
                        0:begin
                            if (!playing) menu <= 1;
                        end
                        1:  menu <= 0;
                        2:  menu <= 4;
                        3:  menu <= 2;
                        4:  menu <= 3;
                    endcase
                end
                else if (btnD) begin
                    case (menu)
                        0:begin
                            if (!playing) menu <= 1;
                        end
                        1:  menu <= 0;
                        2:  menu <= 3;
                        3:  menu <= 4;
                        4:  menu <= 2;
                    endcase
                end
                debounce_count <= 0;
            end
        end
        else if (!(btnC || btnU || btnD) && unclick_flag) begin
            if (debounce_count != debounce_expected) begin
                debounce_count <= debounce_count + 1;
            end else begin
                unclick_flag <= 0;
                debounce_count <= 0;
            end
        end
        
        if (menu == 5) begin
            case (edit)
                16:begin
                    set_mode <= 0;
                    set_change <= 0;
                    menu <= 2;
                end
                default:begin
                    set_mode <= 1;
                    set_change <= frequency[edit];
                    frequency[edit] <= set_out;
                end
            endcase
        end
        
        if (menu == 6) begin
            case (edit)
                16:begin
                    set_mode <= 0;
                    set_change <= 0;
                    menu <= 3;
                end
                default:begin
                    set_mode <= 2;
                    set_change <= duration[edit];
                    duration[edit] <= set_out;
                end
            endcase
        end
        
        if (playing) begin
            if (sw[playing_curr]) begin
                playing_freq <= frequency[playing_curr];
                playing_dur <= duration[playing_curr];
                if (!end_flag) begin
                    trigger <= 1;
                    led[playing_curr] <= 1;
                end
                else if (end_flag && !trigger) begin
                    if (playing_curr > 0) playing_curr <= playing_curr - 1;
                end
                else begin
                    if (playing_curr > 0) trigger <= 0;
                    led <= 0;
                end
            end
            else begin
                if (playing_curr > 0) playing_curr <= playing_curr - 1;
                playing_freq <= 0;
                playing_dur <= 0;
                trigger <= 0;
            end
        end 
        else begin
            playing_curr <= 15;
            trigger <= 0;
            led <= 0;
        end
                
    end
    
    tonePlay logic (.clock(clock), .clk25MHz(clk25MHz), .trigger(trigger), .J(JXADC), .frequency(playing_freq), 
    .duration(playing_dur), .end_flag(end_flag));
endmodule


