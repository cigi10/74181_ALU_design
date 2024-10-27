`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2024 10:48:01 PM
// Design Name: 
// Module Name: ALU
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

module ALU 
(
    input logic [3:0] A,      
    input logic [3:0] B,      
    input logic Cin,          
    input logic [3:0] S,      
    output logic [3:0] result, 
    output logic Cout,       
    output logic overflow      
);
  
    logic [3:0] S_adder;          
    logic C_add;                  
  
    carry_look_ahead_adder cla 
  	(
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S_adder),  
        .C_out(C_add)
    );

    always_comb begin
        result = 4'b0000;
        Cout = 1'b0;
        overflow = 1'b0;

        case (S)
            4'b0000: 
            begin
                result = S_adder;  
                Cout = C_add; 
                overflow = (A[3] == B[3]) && (result[3] != A[3]);
            end

            4'b0001: 
            begin
                result = S_adder;
                Cout = C_add; 
                overflow = (A[3] != B[3]) && (result[3] != A[3]);
            end

            4'b0010: 
            begin
                result = S_adder;
                Cout = C_add;
                overflow = (A[3] == B[3]) && (result[3] != A[3]);
            end

            4'b0011: 
            begin
                result = S_adder;
                Cout = C_add;
                overflow = (A[3] == 1'b1) && (result[3] == 1'b0);
            end

            4'b0100: result = A + (A & B);
            4'b0101: result = A + (A | ~B);
            4'b0110: result = A + (A ^ B);
            4'b0111: 
            begin
                result = S_adder;
                Cout = C_add;
                overflow = (A[3] != B[3]) && (result[3] != A[3]);
            end

            4'b1000: result = A & B;
            4'b1001: result = A | B;
            4'b1010: result = A ^ B;
            4'b1011: result = ~(A | B);
            4'b1100: result = A;
            4'b1101: result = ~A;
            4'b1110: result = ~(A & B);
            4'b1111: result = ~(A ^ B);

            default: result = 4'b0000;
        endcase
    end
endmodule