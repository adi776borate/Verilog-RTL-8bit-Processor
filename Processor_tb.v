`timescale 1ns / 1ps 
 
module Processor_tb; 
    reg clk; 
    reg rstn;  
    wire [7:0] ACC; 
 
    Processor uut ( 
        .clk(clk), 
        .rstn(rstn),  
        .ACC(ACC) 
    ); 
 
    initial begin 
        $display("Time\tPC\tInstruction\tACC\tOutput"); 
    end 
 
    // Clock generation 
    initial begin 
        clk = 0; 
        forever #5 clk = ~clk; 
    end 
 
    // Reset and run 
    initial begin 
        rstn = 0; #12; 
        rstn = 1; 
    end 
 
    // Stop simulation after instruction 18 (HLT) 
    initial begin 
        #300; 
        $finish; 
    end 
endmodule
