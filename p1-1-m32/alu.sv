
module 2mux1(input wire [1:0] in, wire s, output wire out);
  assign out = s ? in[0] : in[1]
endmodule

module 4mux1(input wire [3:0] in, wire [1:0] s);
  
  m1 = 2mux1(
  assign out = s[


endmodule

module alu(input  logic [31:0] a, b,
           input  logic [2:0]  f,
           output logic [31:0] y,
           output logic        zero);
  assign begin
    
endmodule
