`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 12:08:02 PM
// Design Name: 
// Module Name: tb_ALU
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


module tb_ALU();

    logic [3:0] A, B;
    logic Cin;
    logic [3:0] S;
    logic [3:0] result;
    logic Cout;
    logic overflow;

    ALU uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .result(result),
        .Cout(Cout),
        .overflow(overflow)
    );

    initial begin

        A = 4'b0101; B = 4'b0011; Cin = 1'b0; S = 4'b0000;
        #10;
        
        A = 4'b1001; B = 4'b0011; Cin = 1'b1; S = 4'b0001;
        #10;

        A = 4'b0101; B = 4'b0011; Cin = 1'b1; S = 4'b0010;
        #10;

        A = 4'b0110; B = 4'b0000; Cin = 1'b0; S = 4'b0011;
        #10;

        A = 4'b0110; B = 4'b0011; S = 4'b0100;
        #10;

        A = 4'b0101; B = 4'b1100; S = 4'b0101;
        #10;

        A = 4'b0101; B = 4'b0011; S = 4'b0110;
        #10;

        A = 4'b1001; B = 4'b0010; S = 4'b0111;
        #10;

        A = 4'b1101; B = 4'b1010; S = 4'b1000;
        #10;

        A = 4'b1101; B = 4'b1010; S = 4'b1001;
        #10;

        A = 4'b1101; B = 4'b1010; S = 4'b1010;
        #10;

        A = 4'b1101; B = 4'b1010; S = 4'b1011;
        #10;

        A = 4'b1101; S = 4'b1100;
        #10;
    
        A = 4'b1101; S = 4'b1101;
        #10;

        A = 4'b1101; B = 4'b1010; S = 4'b1110;
        #10;
       
        A = 4'b1101; B = 4'b1010; S = 4'b1111;
        #10;

        
        $stop;
    end

endmodule


