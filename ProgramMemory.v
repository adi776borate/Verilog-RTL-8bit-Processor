 // 1. Arithmetic Demo: ADD, SUB, INC, DEC, MOV, NOP, HLT 
`timescale 1ns / 1ps 
module ProgramMemory( 
    input  [3:0] PC, 
    output reg [7:0] Instruction 
); 
    reg [7:0] MEMORY [15:0]; 
    initial begin 
        MEMORY[0] = 8'b0000_0000; // NOP           
        MEMORY[1] = 8'b1001_0001; // MOV ACC,R1    
        MEMORY[2] = 8'b0001_0010; // ADD R2        
        MEMORY[3] = 8'b0010_0011; // SUB R3        
        MEMORY[4] = 8'b0000_0110; // INC ACC       
        MEMORY[5] = 8'b0000_0111; // DEC ACC       
        MEMORY[6] = 8'b1010_0100; // MOV R4,ACC    
        MEMORY[7] = 8'b1111_1111; // HLT           
        MEMORY[8] = 8'b0000_0000; 
        MEMORY[9] = 8'b0000_0000; 
        MEMORY[10]= 8'b0000_0000; 
        MEMORY[11]= 8'b0000_0000; 
        MEMORY[12]= 8'b0000_0000; 
        MEMORY[13]= 8'b0000_0000; 
        MEMORY[14]= 8'b0000_0000; 
        MEMORY[15]= 8'b1111_1111;  
    end 
    always @(*) Instruction = MEMORY[PC]; 
endmodule 
 
 
 
 
 
//  2. MUL & SUB Demo: MUL, SUB, HLT 
//`timescale 1ns / 1ps 
//module ProgramMemory( 
//    input  [3:0] PC, 
//    output reg [7:0] Instruction 
//); 
//    reg [7:0] MEMORY [15:0]; 
//    initial begin
//        MEMORY[0] = 8'b1001_0001; // MOV ACC,R1 
//        MEMORY[1] = 8'b0011_0010; // MUL R2       
//        MEMORY[2] = 8'b0010_0011; // SUB R3      
//        MEMORY[3] = 8'b1111_1111; // HLT 
//        MEMORY[4] = 8'b0000_0000; 
//        MEMORY[5] = 8'b0000_0000; 
//        MEMORY[6] = 8'b0000_0000; 
//        MEMORY[7] = 8'b0000_0000; 
//        MEMORY[8] = 8'b0000_0000; 
//        MEMORY[9] = 8'b0000_0000; 
//        MEMORY[10]= 8'b0000_0000; 
//        MEMORY[11]= 8'b0000_0000; 
//        MEMORY[12]= 8'b0000_0000; 
//        MEMORY[13]= 8'b0000_0000; 
//        MEMORY[14]= 8'b0000_0000; 
//        MEMORY[15]= 8'b1111_1111; 
//    end 
//    always @(*) Instruction = MEMORY[PC]; 
//endmodule 
 
 
// 3. All shifts + AND, XRA, NOP, HLT 
//`timescale 1ns / 1ps 
//module ProgramMemory( 
//    input  [3:0] PC, 
//    output reg [7:0] Instruction 
//); 
//    reg [7:0] MEMORY [15:0]; 
//    initial begin 
//        MEMORY[0] = 8'b0000_0000; // NOP 
//        MEMORY[1] = 8'b1001_0001; // MOV ACC,R1 
//        MEMORY[2] = 8'b0000_0001; // LSL ACC 
//        MEMORY[3] = 8'b0000_0010; // LSR ACC 
//        MEMORY[4] = 8'b0000_0011; // CIR ACC 
//        MEMORY[5] = 8'b0000_0100; // CIL ACC 
//        MEMORY[6] = 8'b0000_0101; // ASR ACC 
//        MEMORY[7] = 8'b0101_0010; // AND R2 
//        MEMORY[8] = 8'b0110_0011; // XRA R3 
//        MEMORY[9]= 8'b1111_1111; // HLT 
//        // fill with NOP 
//        MEMORY[10]= 8'b0000_0000; 
//        MEMORY[11]= 8'b0000_0000; 
//        MEMORY[12]= 8'b0000_0000; 
//        MEMORY[13]= 8'b0000_0000; 
//        MEMORY[14]= 8'b0000_0000; 
//        MEMORY[15]= 8'b1111_1111; 
//    end 
//    always @(*) Instruction = MEMORY[PC]; 
//endmodule 
 
 
 
// 4. Branch & Return Demo: CMP, Br, Ret, MOV, HLT 
//`timescale 1ns / 1ps 
//module ProgramMemory(
//    input  [3:0] PC, 
//    output reg [7:0] Instruction 
//); 
//    reg [7:0] MEMORY [15:0]; 
//    initial begin 
//        // If R1 < R2 then load ACC?R4 else ACC?R3; then save to R5, return to HLT 
//        MEMORY[0] = 8'b1001_0001; // MOV ACC,R1 
//        MEMORY[1] = 8'b0111_0010; // CMP R2        
//        MEMORY[2] = 8'b1000_0101; // Br 5          
//        MEMORY[3] = 8'b1001_0011; // MOV ACC,R3    
//        MEMORY[4] = 8'b1000_0110; // Br 6          
//        MEMORY[5] = 8'b1001_0100; // MOV ACC,R4    
//        MEMORY[6] = 8'b1010_0101; // MOV R5,ACC    
//        MEMORY[7] = 8'b1011_1001; // RET 9         
//        MEMORY[8] = 8'b0000_0000; // NOP (dead) 
//        MEMORY[9] = 8'b1111_1111; // HLT 
//        // unused 
//        MEMORY[10]= 8'b0000_0000; 
//        MEMORY[11]= 8'b0000_0000; 
//        MEMORY[12]= 8'b0000_0000; 
//        MEMORY[13]= 8'b0000_0000; 
//        MEMORY[14]= 8'b0000_0000; 
//        MEMORY[15]= 8'b1111_1111; 
//    end 
//    always @(*) Instruction = MEMORY[PC]; 
//endmodule 
 
 
//5. Upto counter upto 15 
//`timescale 1ns / 1ps 
 
//module ProgramMemory( 
//    input [3:0] PC,  
//    output reg [7:0] Instruction  
//); 
//    reg [7:0] MEMORY [15:0];   
//    initial begin 
//        //Increment ACC (starting from R1) until it equals R15 
         
//        MEMORY[0] = 8'b1001_0000; // MOV ACC, R1   
//        MEMORY[1] = 8'b0000_0110; // INC ACC       
//        MEMORY[2] = 8'b0111_1111; // CMP R15        
//        MEMORY[3] = 8'b1000_0001; // Br 2          
//        MEMORY[4] = 8'b1111_1111; // HLT           
//        MEMORY[5] = 8'b1111_1111; // HLT           
         
//        MEMORY[6] = 8'b0000_0000;  
//        MEMORY[7] = 8'b0000_0000; 
//        MEMORY[8] = 8'b0000_0000; 
//        MEMORY[9] = 8'b0000_0000; 
//        MEMORY[10] = 8'b0000_0000; 
//        MEMORY[11] = 8'b0000_0000; 
//        MEMORY[12] = 8'b0000_0000; 
//        MEMORY[13] = 8'b0000_0000; 
//        MEMORY[14] = 8'b0000_0000;
//        MEMORY[15] = 8'b1111_1111;  
//    end 
 
//    always @(*) begin 
//        Instruction = MEMORY[PC];   
//    end 
//endmodule 

