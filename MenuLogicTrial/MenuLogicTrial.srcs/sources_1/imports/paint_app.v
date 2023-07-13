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


module paint_app (
    input clock, input [2:0]sw, input left,right,middle,
    input [11:0]xpos, input [11:0]ypos,
    output [15:13]led,
    output [7:0]JC
    );
   // reg [11:0] value = 96; reg setmax_x = 1; reg setmax_y = 1; 
    reg middle_pressed = 0; reg [15:13]led_update;
    wire [11:0]xposa;
    assign xposa = xpos-96; 
    //wire left; wire right; wire middle; wire [3:0]middle_scroll;
    //wire [11:0]xpos; wire [11:0]ypos;
    
//    MouseCtl mouse(.clk(clock), //.rst(RESET), 
//    .value(value[11:0]),// .setx(setx), .sety(sety), 
//    .setmax_x(setmax_x), .setmax_y(setmax_y),
//    .xpos(xpos[11:0]), .ypos(ypos[11:0]),// .zpos(zpos[3:0]), 
//    .left(left), .middle(middle), .right(right), //.new_event(new_event), 
//    .ps2_clk(ps2_clk), .ps2_data(ps2_data)
//    );
    
    paint_application paintStart(.CLOCK(clock), .xpos(xposa[11:0]), .ypos(ypos[11:0]),
    .middle(middle), .left(left), .right(right), .led(led[15:13]), .sw(sw[2:0]), .JC(JC[7:0])
    );

endmodule