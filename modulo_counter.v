module modulo_counter(input wire clk, input wire rst,
                      output wire [2:0] state, output wire divided_clk);
    wire [2:0] incremented;
    wire c0, c1, unused_carry;
    wire terminal_count;
    wire [2:0] next_state;
    wire next_output;

    // Three full adders form the structural 3-bit incrementer (+1).
    full_adder fa0(.a(state[0]), .b(1'b1), .cin(1'b0), .sum(incremented[0]), .cout(c0));
    full_adder fa1(.a(state[1]), .b(1'b0), .cin(c0),   .sum(incremented[1]), .cout(c1));
    full_adder fa2(.a(state[2]), .b(1'b0), .cin(c1),   .sum(incremented[2]), .cout(unused_carry));

    // Count 0,1,2,3,4,5; on the sixth rising edge, reset to 0
    // and toggle the output. A complete output period is 12 edges.
    assign terminal_count = state[2] & ~state[1] & state[0]; // 3'b101 = 5
    assign next_state = incremented & {3{~terminal_count}};
    assign next_output = divided_clk ^ terminal_count;

    d_ff bit0(.clk(clk), .rst(rst), .d(next_state[0]), .q(state[0]));
    d_ff bit1(.clk(clk), .rst(rst), .d(next_state[1]), .q(state[1]));
    d_ff bit2(.clk(clk), .rst(rst), .d(next_state[2]), .q(state[2]));
    d_ff out_ff(.clk(clk), .rst(rst), .d(next_output), .q(divided_clk));
endmodule
