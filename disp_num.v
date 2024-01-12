`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/06/2024 10:07:41 AM
// Design Name: 
// Module Name: disp_num
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


module disp_num(
    input [3:0] num,
    input clk,
    output reg [6:0] disp
    );
    wire [6:0] map[9:0];
    assign map[0] = 7'b1000000;
    assign map[1] = 7'b1111001;
    assign map[2] = 7'b0100100;
    assign map[3] = 7'b0110000;
    assign map[4] = 7'b0011001;
    assign map[5] = 7'b0010010;
    assign map[6] = 7'b0000010;
    assign map[7] = 7'b1111000;
    assign map[8] = 7'b0000000;
    assign map[9] = 7'b0011000;
    always @(posedge clk) begin 
        disp = map[num];
    end
endmodule
