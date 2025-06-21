`timescale 1ns / 1ps 
// ALU: Performs Arithmetic and Logical Operations 
module ALU ( 
    input [7:0] ACC,           // Accumulator input 
    input [7:0] Ri,            // Register input 
    input [7:0] Opcode,        // Instruction Opcode 
    output reg [7:0] Result,   // ALU output 
    output reg CB,             // Carry/Borrow 
    output reg [7:0] EXT       // Extended register for MUL result 
); 
    reg [8:0] temp; 
    reg [15:0] temp_mul; 
 
 
    initial begin 
        // Default output assignments 
        Result = ACC; 
        CB = 0; 
        EXT = 0; 
     
    end 
 
    always @(*) begin 
 
        case (Opcode[7:4]) 
            4'b0001: begin // ADD   
                temp = {1'b0, ACC} + {1'b0, Ri}; 
                Result = temp[7:0]; 
                CB = temp[8]; 
            end 
            4'b0010: begin // SUB   
                temp = {1'b0, ACC} - {1'b0, Ri}; 
                Result = temp[7:0]; 
                CB = temp[8]; 
            end 
            4'b0011: begin // MUL   
                temp_mul = ACC * Ri; 
                Result = temp_mul[7:0]; 
                EXT = temp_mul[15:8]; 
            end 
            4'b0101: begin // AND   
                Result = ACC & Ri; 
            end 
            4'b0110: begin // XRA Ri (bitwise XOR)
                 Result = ACC ^ Ri; 
            end 
            4'b0111: begin // CMP Ri (Compare ACC with Ri) 
                // If ACC > Ri then CB is set to 1, otherwise 0. 
                CB = (ACC < Ri) ? 1'b1 : 1'b0; 
            end 
            4'b0000: begin // Shift, Increment, Decrement operations 
                case (Opcode[3:0]) 
                    4'b0001: Result = ACC << 1;                    //   Logical Shift Left 
                    4'b0010: Result = ACC >> 1;                    //   Logical Shift Right 
                    4'b0011: Result = {ACC[0], ACC[7:1]};          //   Circuit (rotate) right 
                    4'b0100: Result = {ACC[6:0], ACC[7]};          //   Circuit (rotate) left 
                    4'b0101: Result = {ACC[7], ACC[7:1]};          //   Arithmetic Shift Right 
                    4'b0110: begin                               //   Increment ACC 
                        temp = {1'b0, ACC} + 9'd1; 
                        Result = temp[7:0]; 
                        CB = temp[8]; 
                    end 
                    4'b0111: begin                               //   Decrement ACC 
                        temp = {1'b0, ACC} - 9'd1; 
                        Result = temp[7:0]; 
                        CB = temp[8]; 
                    end 
                    default: Result = ACC; //  default case for undefined sub-opcodes 
                endcase 
            end 
            default: Result = ACC; //  default case for undefined opcodes 
        endcase 
    end 
endmodule
