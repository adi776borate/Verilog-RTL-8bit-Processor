`timescale 1ns / 1ps 
 
module ALU_tb; 
    reg [7:0] ACC; 
     reg [7:0] Ri; 
    reg [7:0] Opcode; 
    wire [7:0] Result; 
    wire CB; 
    wire [7:0] EXT; 
 
    ALU uut ( 
        .ACC(ACC), 
        .Ri(Ri), 
        .Opcode(Opcode), 
        .Result(Result), 
        .CB(CB), 
        .EXT(EXT) 
    ); 
 
    initial begin 
        // ADD R1 
        ACC = 8'd10; Ri = 8'd20; Opcode = 8'b0001_0001; #10; 
 
        // SUB R2 
        ACC = 8'd30; Ri = 8'd25; Opcode = 8'b0010_0010; #10; 
 
        // MUL R3 
        ACC = 8'd5; Ri = 8'd4; Opcode = 8'b0011_0011; #10; 
 
        // AND R4 
        ACC = 8'b10101010; Ri = 8'b11110000; Opcode = 8'b0101_0100; #10; 
 
        // XRA R5 
        ACC = 8'b10101010; Ri = 8'b11110000; Opcode = 8'b0110_0101; #10; 
 
        // CMP R6 
        ACC = 8'd10; Ri = 8'd15; Opcode = 8'b0111_0110; #10; 
 
        // LSL ACC 
        ACC = 8'b00001111; Ri = 8'd0; Opcode = 8'b0000_0001; #10; 
 
        // LSR ACC 
        ACC = 8'b11110000; Ri = 8'd0; Opcode = 8'b0000_0010; #10; 
 
        // INC ACC 
        ACC = 8'd255; Ri = 8'd0; Opcode = 8'b0000_0110; #10; 
 
        // DEC ACC 
        ACC = 8'd0; Ri = 8'd0; Opcode = 8'b0000_0111; #10; 
 
        $finish; 
    end 
endmodule
