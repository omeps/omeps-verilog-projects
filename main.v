`timescale 1ns /  1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2024 08:45:53 PM
// Design Name: 
// Module Name: main
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


module main(
    input [15:0] sw,
    input clk,
    output [6:0] seg,
    output [15:0] led,
    output reg [3:0] an
    );
    wire [6:0] nums [3:0];
    disp_num dp0(sw[3:0],clk,nums[0]);
    disp_num dp1(sw[7:4],clk,nums[1]);
    disp_num dp2(sw[11:8],clk,nums[2]);
    disp_num dp3(sw[15:12],clk,nums[3]);
    assign led = sw;
    assign seg = (nums[0] & {7{!an[0]}}) | 
                 (nums[1] & {7{!an[1]}}) | 
                 (nums[2] & {7{!an[2]}}) | 
                 (nums[3] & {7{!an[3]}});
    reg clock;
    reg [8:0] counter;
    initial begin
        an = 4'b0111;
        clock = 0;
        counter = 0;  
    end
    always @(posedge clk) begin
        if (counter == 199) begin
            counter <= 0;
            clock <= !clock;
        end else begin 
            counter <= counter + 1;
        end
    end

    always @(posedge clock ) begin
        an[3:1] <= an[2:0];
        an[0] <= an[3];
    end
endmodule

