
module 2mux1_32bit(input wire [31:0] a, b,
                   input wire s,
                   output wire [31:0] q);
  assign out = s ? a : b;
endmodule

module 4mux1_32bit(input wire [31:0] a, b, c, d,
                   input wire [1:0] s,
                   output wire [31:0] q);
  ma 2mux1(a, b, s[0], qa);
  mb 2mux1(c, d, s[0], qb);
  assign q = s[1] ? qa : qb;
endmodule

module alu(input logic [31:0] a, b,
           input logic [2:0] f,
           output logic [31:0] y,
           output logic zero);
  assign begin
    m1 2mux1_32bit(b, ~b, f[2], bb);
    ma = a & bb;
    mb = a | bb;
    mc = a + bb;
    md = a + bb; /* TODO: this should be zero-extend / SLT */
    m 4mux1_32bit(ma, mb, mc, md, f[0:1], y);
  end
endmodule
