
module mux2to1( input wire [31:0] i0,i1, input wire op, output wire [31:0] out);
assign out = op ? i1 : i0;
endmodule

module mux4to1 (input wire [31:0] i0,i1,i2,i3, input wire [1:0] op, output wire [31:0] out); 
wire [31:0] outmux0, outmux1;
mux2to1 dut0(i0,i1,op[0],outmux0);
mux2to1 dut1(i2,i3,op[0],outmux1);
mux2to1 dut2(outmux0,outmux1,op[1],out);
endmodule


module RCA (input wire [31:0] a,b, input wire op, output wire [31:0] s);

//assign s = op ? A - B : A + B;
//How to get Cout??? A + B is over 33 bits max , so we do the following
assign s = op ? a + b + 1 : a + b;

//op equal to 1 implies b is inverted

// cout concatenated with s is over 33 bits

endmodule


module zeroextender(input wire a , output wire [31:0] aex);

assign aex [0]= a;
assign aex [31:1] = 30'b0;

endmodule

module ALU(input  logic [31:0] a, b, 
	   input  logic [2:0]  f,
	   output logic [31:0] y,output logic zero);

wire [31:0]mux21out;
wire [31:0]mux41out;
wire [31:0]rcaout;
wire cout;
wire [31:0]zeroex;

mux2to1 mux21(b,~b,f[2],mux21out);
RCA adder(a,mux21out,f[2],rcaout,cout);
zeroextender ze(rcaout[31],zeroex);
mux4to1 mux41(a & mux21out, a | mux21out, rcaout,zeroex,f[1:0],mux41out);

assign y = mux41out;
assign zero = ~(|mux41out);

endmodule 
