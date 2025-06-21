`timescale 1ns / 1ps 
module Register #( 
    parameter INIT_VAL = 8'd0 
)( 
    input clk, 
    input we, 
    input [7:0] d, 
    output reg [7:0] q 
); 
    initial begin 
        q = INIT_VAL; 
    end 
 
    always @(posedge clk) begin 
        if (we) 
            q <= d; 
    end 
endmodule 
 
module RegisterFile ( 
    input clk, 
    input [3:0] Addr,         // Address to read/write 
    input [7:0] WriteData,    // Data to write 
    input WriteEnable,        // Write enable signal 
    output [7:0] ReadData     // Output data 
); 
    wire [7:0] reg_out [15:0];     
    reg [15:0] we_vector;         
 
    integer i; 
    always @(*) begin 
        for (i = 0; i < 16; i = i + 1) 
            we_vector[i] = (WriteEnable && (Addr == i)); 
    end 
 
    // Generate 16 Register Instances  
    genvar idx; 
    generate 
        for (idx = 0; idx < 16; idx = idx + 1) begin : reg_block 
            Register #(.INIT_VAL(idx)) reg_inst ( 
                .clk(clk), 
                .we(we_vector[idx]), 
                .d(WriteData), 
                .q(reg_out[idx])
            ); 
        end 
    endgenerate 
 
    assign ReadData = reg_out[Addr]; 
 
endmodule
