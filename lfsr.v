`timescale 1ns / 1ps

module lfsr (
    input        clk,
    input        rst,
    output [3:0] data_out
);

reg [3:0] lfsr_reg;
wire feedback;

assign feedback = lfsr_reg[3] ^ lfsr_reg[2] ^ lfsr_reg[1];

always @(posedge clk or posedge rst) begin
    if (rst)
        lfsr_reg <= 4'b0001;   
    else
        lfsr_reg <= {lfsr_reg[2:0], feedback};
end

assign data_out = lfsr_reg;

endmodule
