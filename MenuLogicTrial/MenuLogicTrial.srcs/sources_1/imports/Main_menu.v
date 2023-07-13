`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 14:47:46
// Design Name: 
// Module Name: Main_menu
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


module Main_menu(
        //JOOHOES CODE
        input clock,
        input btnC,
        input btnL,
        input btnR,
        input btnU,
        input btnD,
        input [15:0] sw,
        output reg [7:0] JXADC,
        output reg [6:0] seg,
        output reg [3:0] an,
        output reg dp,
        // KEDRIANS CODE
        input J_MIC_Pin3,
        output reg J_MIC_Pin4,
        output reg J_MIC_Pin1,
        output reg [15:0] led,
        //
        output reg [7:0] JC,
        output [7:0] JA,
        inout ps2_clk, ps2_data 
    );
    
    //ALL REGISTERS SHOULD BE INITIALIZED TO 0
    reg [15:0] sw_state [10:0];
    reg [10:0] btnC_state;
    reg [10:0] btnL_state;
    reg [10:0] btnR_state;
    reg [10:0] btnU_state;
    reg [10:0] btnD_state;
    reg [10:0] J_MIC_PIN3_state;
    reg [11:0] xpos_state [10:0];
    reg [11:0] ypos_state [10:0];
    
    //ADD HERE TO INITIALIZE
    integer i;
    initial begin
        for (i=0; i<10; i=i+1) begin
            sw_state[i] <= 0;
            btnC_state[i] <= 0;
            btnL_state[i] <= 0;
            btnR_state[i] <= 0;
            btnU_state[i] <= 0;
            btnD_state[i] <= 0;
            J_MIC_PIN3_state[i] <= 0;
            xpos_state[i] <= 0;
            ypos_state[i] <= 0;
        end
    end
    wire [15:0] led_state [10:0];
    wire [6:0] seg_state [10:0];
    wire [3:0] an_state [10:0];
    wire [10:0] dp_state;
    
    wire [7:0] JXADC_state [10:0];
    wire [7:0] JC_state [10:0];
    //wire [7:0] JA_state;
    wire [10:0] J_MIC_PIN4_state ;
    wire [10:0] J_MIC_PIN1_state ;
    
    reg [3:0] menu_out = 0;
    wire [3:0] menu_state;
    wire [3:0] prev_state;
    
    wire left, right, middle; wire one_left_click;
    wire [11:0]xpos; wire [11:0]ypos; reg [11:0]ypos_adjusted;
    wire [3:0] state;
    reg [11:0] value = 192; reg setmax_x = 1; reg setmax_y = 1; reg middle_pressed = 0;
    //assign JA = JA_state;
    wire state6;
//    reg left_click = 0;
    
    //TO RESET THE PREVIOUS STATE OUTPUTS TO 0
    //ALSO TO RESET THE PREVIOUS STATE INPUT TO 0
//    always @(menu_state) begin
//        //menu_state <= menu_out;
//        prev_state <= menu_state;
//    end

//    reg unclick_flag = 0;
//    always @(*) begin
//        if (left) begin
//            if (!unclick_flag) begin
//                left_click <= 1;
//                unclick_flag <= 1;
//            end
//            else left_click <= 0;
//        end
//        else begin
//            unclick_flag <= 0;
//        end
//    end
    
    always @(posedge clock) begin
        case(menu_state)
            1:begin //Task A Kedrian Basic
                J_MIC_PIN3_state[1] <= J_MIC_Pin3;
                sw_state[1] <= sw;
                led <= led_state[1];
                seg <= seg_state[1];
                an <= an_state[1];
                J_MIC_Pin4 <= J_MIC_PIN4_state[1];
                J_MIC_Pin1 <= J_MIC_PIN1_state[1];
                JC <= JC_state[9]; //Display JC "OFF" state.
            end
            2:begin //Task B Joo Hoe Basic
                sw_state[2] <= sw;
                btnC_state[2] <= btnC;
////                btnL_state[prev_state] <= 0;
////                btnR_state[prev_state] <= 0;
////                btnU_state[prev_state] <= 0;
////                btnD_state[prev_state] <= 0;
//                //J_MIC_PIN3_state[prev_state] <= 0;
                
//                led <= 0;
//                seg <= 7'b1111111;
//                an <= 4'b1111;
//                dp <= 1;
                
                JXADC <= JXADC_state[2];
                JC <= JC_state[9]; //Display JC "OFF" state.
//                //JA <= JA_state;
//                J_MIC_Pin4 <= 0;
//                J_MIC_Pin1 <= 0;
            end
            3:begin //Task C Kai Wen Basic (Remember to turn on switch 0 to "lock" the cursor)
                sw_state[3] <= sw;
                led <= led_state[3];
                JC <= JC_state[3];
                xpos_state[3] <= xpos;
                ypos_state[3] <= ypos;
            end
            4:begin //Task D Sze Wen Basic
                sw_state[4] <= sw; //For reading input of switches by sw_state 4, which is passed into task_d for processing.              
                JC <= JC_state[4];
            end
            5:begin //Basic Integration Group Task
                sw_state[5] <= sw;
////                btnC_state[prev_state] <= 0;
////                btnL_state[prev_state] <= 0;
////                btnR_state[prev_state] <= 0;
////                btnU_state[prev_state] <= 0;
////                btnD_state[prev_state] <= 0;
                J_MIC_PIN3_state[5] <= J_MIC_Pin3;
                
                led <= led_state[5];
                seg <= seg_state[5];
                an <= an_state[5];
                dp <= dp_state[5];
                JXADC <= JXADC_state[5];
                JC <= JC_state[5];
//JC <= JC_state[9];//temp 
                J_MIC_Pin4 <= J_MIC_PIN4_state[5];
                J_MIC_Pin1 <= J_MIC_PIN1_state[5];
                xpos_state[5] <= xpos;
                ypos_state[5] <= ypos;
            end
            6:begin //Improvement A(Paint) Kai Wen
                sw_state[6] <= sw;                           
                led <= led_state[6];
//                seg <= seg_state[6];
//                an <= an_state[6];
//                dp <= dp_state[6];
                
//                JXADC <= 0;
//                seg <= 7'b1111111;
//                an <= 4'b1111;
//                dp <= 1;
                JC <= JC_state[6];
//                //JA <= JA_state;
                xpos_state[6] <= xpos;
                ypos_state[6] <= ypos;
            end
            7:begin //Improvement B(Music) Joo Hoe
                sw_state[7] <= sw;
                btnC_state[7] <= btnC;
                btnL_state[7] <= btnL;
                btnR_state[7] <= btnR;
                btnU_state[7] <= btnU;
                btnD_state[7] <= btnD;
//                //J_MIC_PIN3_state[prev_state] <= 0;
                
                led <= led_state[7];
                seg <= seg_state[7];
                an <= an_state[7];
                dp <= dp_state[7];
                
                JXADC <= JXADC_state[7];
                JC <= JC_state[9]; //Display JC "OFF" state.
//                //JA <= JA_state;
                J_MIC_Pin4 <= 0;
                J_MIC_Pin1 <= 0;
            end
            8:begin //Improvement C (Recognition) Kedrian
//                kedrian impr_c(.basys_clock(clock), .JC_MIC_Pin3(J_MIC_PIN3_state[8]), .sw0(sw_state[8][0]),
//            .sw14(sw_state[8][14]),.sw15(sw_state[8][15]), .led10(led_state[8][10]), .led11(led_state[8][11])
//            , .led12(led_state[8][12]), .J_MIC_Pin4(J_MIC_PIN4_state[8]), .J_MIC_Pin1(J_MIC_PIN1_state[8]),
//            .led(led_state[8][8:0]), .seg(seg_state[8][7:0]), .an(an_state[8][3:0]));
                J_MIC_PIN3_state[8] <= J_MIC_Pin3;
                sw_state[8] <= sw;
                J_MIC_Pin4 <= J_MIC_PIN4_state[8];
                 J_MIC_Pin1 <= J_MIC_PIN1_state[8];
                 seg <= seg_state[8];
                 an <= an_state[8];
                 dp <= dp_state[8];
                 JC <= JC_state[9]; //Display JC "OFF" state.
                 led <= led_state[8];
            end
            9:begin //Improvement D (Animation) Sze Wen              
                JC <= JC_state[9]; //Since its at menu_state = 9, Venusaur animation shows up.
                xpos_state[9] <= xpos;
                ypos_state[9] <= ypos;
                sw_state[9] <= sw;
            end
            10:begin //Group Improvement
                 J_MIC_PIN3_state[10] <= J_MIC_Pin3;
                 sw_state[10] <= sw;
                 J_MIC_Pin4 <= J_MIC_PIN4_state[10];
                 J_MIC_Pin1 <= J_MIC_PIN1_state[10];
                 seg <= seg_state[10];
                 an <= an_state[10];
                 dp <= dp_state[10];
                 JC <= JC_state[10];
            end
            0:begin
//                sw_state[prev_state] <= 0;
//                btnC_state[prev_state] <= 0;
//                btnL_state[prev_state] <= 0;
//                btnR_state[prev_state] <= 0;
//                btnU_state[prev_state] <= 0;
//                btnD_state[prev_state] <= 0;
//                J_MIC_PIN3_state[prev_state] <= 0;
                
                led <= 0;
                seg <= 7'b1111111;
                an <= 4'b1111;
                dp <= 1;
                
                JXADC <= 0;
                JC <= JC_state[9]; //Display JC "OFF" state.
                
                J_MIC_Pin4 <= 0;
                J_MIC_Pin1 <= 0;
            end
        endcase
        
        //For adjustment of Y-Coordinate of mouse such that it won't escape the screen.
        ypos_adjusted[11:0] <= (ypos <= 1) ? 1 : 
                               (ypos >= 62) ? 62 : ypos;
                      
//        if (menu_state != 1 && menu_state != 3 && menu_state != 4 && menu_state != 7 && menu_state != 9) begin
//        led <= menu_state;
//        end
    end
    
    //Correct
    StudentA task_a (.basys_clock(clock), .J_MIC_Pin3(J_MIC_PIN3_state[1]), .sw1(sw_state[1][1]),
    .J_MIC_Pin4(J_MIC_PIN4_state[1]) , .J_MIC_Pin1(J_MIC_PIN1_state[1]), .led(led_state[1][8:0]), .seg(seg_state[1]), .an(an_state[1]));
    
    //Correct
    StudentB task_b (.clock(clock), .btnC(btnC_state[2]), .sw(sw_state[2][0]), .JXADC(JXADC_state[2]));
    
    //Correct, just remember turn on switch 0 to "lock" cursor.
    StudentC task_c (.clock(clock), .sw0(sw_state[3][0]), .left(left), .right(right), .middle(middle),
    .xpos(xpos[11:0] - 96), .ypos(ypos_adjusted[11:0]), .JC(JC_state[3]), .led(led_state[3][15:13]));
    
    //Correct
    StudentD task_d (.CLOCK(clock), .JC(JC_state[4]), .sw15(sw_state[4][15]), .sw(sw_state[4][9:0]));
    
    Top_Student task_group (.clock(clock), .sw(sw_state[5]), .JXADC(JXADC_state[5]), 
    .seg(seg_state[5]), .an(an_state[5]), .J_MIC_Pin3(J_MIC_PIN3_state[5]), .J_MIC_Pin4(J_MIC_PIN4_state[5]), 
    .J_MIC_Pin1(J_MIC_PIN1_state[5]), .led(led_state[5][12:0]), .leds(led_state[5][15:13]), .JC(JC_state[5]), 
    .xpos(xpos_state[5][11:0]), .ypos(ypos_state[5][11:0]), .left(left), .middle(middle), .right(right), .dp(dp_state[5]));
    
    //Correct, just need to implement lock for pressing back.
    paint_app impr_a (.clock(clock), .sw(sw_state[6][2:0]), .led(led_state[6][15:13]), .JC(JC_state[6]),
    .left(left), .right(right), .middle(middle), .xpos(xpos_state[6][11:0]), .ypos(ypos_state[6][11:0])); 
    
    //Correct
    toneMenu impr_b (.clock(clock), .btnC(btnC_state[7]), .btnL(btnL_state[7]), .btnR(btnR_state[7]), 
    .btnU(btnU_state[7]), .btnD(btnD_state[7]), .sw(sw_state[7]), .seg(seg_state[7]), .dp(dp_state[7]),
    .an(an_state[7]), .JXADC(JXADC_state[7]), .led(led_state[7][15:0]));
    
    kedrian impr_c(.basys_clock(clock), .J_MIC_Pin3(J_MIC_PIN3_state[8]), .sw0(sw_state[8][0]),
    .sw14(sw_state[8][14]),.sw15(sw_state[8][15]), .led10(led_state[8][10]), .led11(led_state[8][11])
    , .led12(led_state[8][12]), .J_MIC_Pin4(J_MIC_PIN4_state[8]), .J_MIC_Pin1(J_MIC_PIN1_state[8]),
    .led(led_state[8][8:0]), .seg({dp_state[8],seg_state[8]}), .an(an_state[8]));
    
//    input basys_clock, input J_MIC_Pin3, input sw0, sw14, sw15,
//    output reg led10, led11, led12, output J_MIC_Pin4 ,output J_MIC_Pin1, output reg [8:0]led = 9'd0, 
//    output reg [7:0]seg = 8'b11000000, output reg [3:0]an = 4'b0000
    
    //Correct
    //Important, also used for painting the JC OLED black, giving the illusion of OLED "off".
    animate_venusaur impr_d(.CLOCK(clock), .JC(JC_state[9]), .sw(sw_state[9]), .left(left), .right(right), 
    .middle(middle), .xpos(xpos_state[9]), .ypos(ypos_adjusted[11:0]), .state(menu_state[3:0]));
    
    //Correct
    MorseTest impr_group(
    .clock(clock), .J_MIC_Pin3(J_MIC_PIN3_state[10]), .sw(sw_state[10]), .J_MIC_Pin4(J_MIC_PIN4_state[10]),
    .J_MIC_Pin1(J_MIC_PIN1_state[10]), .an(an_state[10]), .seg(seg_state[10]), .dp(dp_state[10]), .JC(JC_state[10]));
    
    //Correct
    Menu menu_UI(.CLOCK(clock), .JA(JA[7:0]), .sw(sw_state[0]), .state(menu_state[3:0]),
     .left(left), .right(right), .middle(middle), .xpos(xpos[11:0]), .ypos(ypos_adjusted[11:0])
     , .state6(sw_state[6][0]));
    
    //Correct
    MouseCtl mouse(.clk(clock), .value(value[11:0]), .setmax_x(setmax_x), .setmax_y(setmax_y),
    .xpos(xpos[11:0]), .ypos(ypos[11:0]), .left(left), .middle(middle), .right(right), 
    .ps2_clk(ps2_clk), .ps2_data(ps2_data));
   
   
endmodule
