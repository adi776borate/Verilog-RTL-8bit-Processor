`timescale 1ns / 1ps 
module ProgramMemory_tb; 
 
    reg [3:0] PC; 
    wire [7:0] Instruction; 
 
    // Instantiate the ProgramMemory module 
    ProgramMemory uut ( 
        .PC(PC), 
        .Instruction(Instruction) 
    ); 
 
    integer i; 
 
    initial begin 
        // Loop through all possible PC values (0 to 15) 
        for (i = 0; i < 16; i = i + 1) begin 
            PC = i[3:0]; 
            #10; // Wait for 10 ns to allow Instruction to update 
        end 
        #10; // Final delay before simulation ends 
        $finish; 
    end 
 
endmodule
