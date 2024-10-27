`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2024 11:00:24 PM
// Design Name: 
// Module Name: tb_carry_lookahead_adder
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


module tb_carry_lookahead_adder();

    logic [3:0] A;
    logic [3:0] B;
    logic Cin;
    logic [3:0] S;
    logic C_out;

    carry_look_ahead_adder cla_adder (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .C_out(C_out)
    );

    initial begin
        A = 4'b0000; B = 4'b0000; Cin = 0; #10;
        A = 4'b0101; B = 4'b0011; Cin = 0; #10;
        A = 4'b1001; B = 4'b0110; Cin = 1; #10;
        A = 4'b1111; B = 4'b1111; Cin = 1; #10;
        $finish;
    end
    
endmodule
