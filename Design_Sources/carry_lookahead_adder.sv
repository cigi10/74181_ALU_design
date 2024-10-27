`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2024 10:33:30 PM
// Design Name: 
// Module Name: carry_lookahead_adder
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

module carry_look_ahead_adder (
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic Cin,
    output logic [3:0] S,    
    output logic C_out
);
    logic [3:0] G;
    logic [3:0] P;
    logic C1, C2, C3, C4;

    assign G = A & B;
    assign P = A | B;

    assign C1 = (Cin & P[0]) | G[0];                                  
    assign C2 = (Cin & P[0] & P[1]) | (G[0] & P[1]) | G[1];           
    assign C3 = (Cin & P[0] & P[1] & P[2]) | (G[0] & P[1] & P[2]) | (G[1] & P[2]) | G[2]; 
    assign C4 = (Cin & P[0] & P[1] & P[2] & P[3]) | (G[0] & P[1] & P[2] & P[3]) | (G[1] & P[2] & P[3]) | (G[2] & P[3]) | G[3];

    assign S[0] = A[0] ^ B[0] ^ Cin;  
    assign S[1] = A[1] ^ B[1] ^ C1;  
    assign S[2] = A[2] ^ B[2] ^ C2;  
    assign S[3] = A[3] ^ B[3] ^ C3;  

    assign C_out = C4;

endmodule
