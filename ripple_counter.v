module ripple_counter(input wire clk, input wire rst, output wire [2:0] state);
    // Positive-edge T-FFs clock from inverted previous Q so each
    // stage advances on the preceding stage's falling edge.
    t_ff stage0(.clk(clk),       .rst(rst), .t(1'b1), .q(state[0]));
    t_ff stage1(.clk(~state[0]), .rst(rst), .t(1'b1), .q(state[1]));
    t_ff stage2(.clk(~state[1]), .rst(rst), .t(1'b1), .q(state[2]));
endmodule
