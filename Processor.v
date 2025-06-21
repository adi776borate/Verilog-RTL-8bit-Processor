`timescale 1ns / 1ps 
 
// Top module for processor 
module Processor ( 
    input clk, 
    input rstn, 
    output reg  [7:0] ACC 
); 
    // Program counter 
    reg  [3:0] PC; 
     
    // Extra space to store result of mulitplication 
    wire [7:0] EXT; 
     
    // Carry bit for addition , subtractor and for branch instruction 
    wire       CB; 
     
    // Wires for connecting instructions from program memory to input of alu 
    wire [7:0] Instruction; 
     
    // Wires to connect the active register to input of alu 
    wire [7:0] RegData; 

    // Wires to connect the result of alu to accumulator  
    wire [7:0] ALUResult; 
     
    // Storage to extract adxdress from operation code 
    reg  [3:0] Addr; 
     
    // Flags for  write,branch,return and halt 
    reg        WriteEnable; 
    reg        IsBranch; 
    reg        IsRet; 
    reg        IsHalt; 
  
     
    // Instantiating all the modules 
    ProgramMemory U1(PC, Instruction); 
    RegisterFile  U2(clk, Addr, ACC, WriteEnable, RegData ); 
    ALU           U3(ACC, RegData, Instruction, ALUResult, CB, EXT); 
    
 
    // Decoding the operation code 
    always @(*) begin 
        Addr        = Instruction[3:0]; 
        WriteEnable = 0; 
        IsBranch    = 0; 
        IsRet       = 0; 
        IsHalt      = 0; 
 
        case (Instruction[7:4]) 
            4'b1010: WriteEnable = 1; 
            4'b1000: IsBranch    = 1; 
            4'b1011: IsRet       = 1; 
            4'b1111: IsHalt      = 1; 
        endcase 
    end 
 
     
    always @(posedge clk or negedge rstn) begin 
     
        // reset 
        if (!rstn) begin 
            PC     <= 4'd0; 
            ACC    <= 8'd0; 
        end 
         
        else begin 
            // Either move data from register or update the acc by alu result 
            case (Instruction[7:4]) 
                4'b1001: ACC <= RegData; 
                 
                default: ACC <= ALUResult;   
            endcase 
 
            // Branching Condition 
            if (IsBranch && CB)
                 PC <= Instruction[3:0]; 
            // Return condition 
            else if (IsRet) 
                PC <= Instruction[3:0]; 
            // Halting condition 
            else if (!IsHalt) 
                PC <= PC + 1; 
            else 
                PC <= PC; 
        end 
    end 
endmodule
