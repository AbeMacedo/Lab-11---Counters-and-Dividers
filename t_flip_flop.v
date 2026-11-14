module t_ff(input wire clk, input wire rst, input wire t, output wire q);
    wire d;
    assign d = q ^ t;
    d_ff storage(.clk(clk), .rst(rst), .d(d), .q(q));
endmodule
