module mux3 #(parameter WIDTH = 8)
            (input logic [WIDTH-1:0] d0, d1, d2,
             input logic [1:0] s,
             output logic [WIDTH-1:0] y);
  assign #1 y = s[1] ? d2 : (s[0] ? d1 : d0);
endmodule

module mux4 #(parameter WIDTH = 8)
            (input logic [WIDTH-1:0] d0, d1, d2, d3,
             input logic [1:0] s,
             output logic [WIDTH-1:0] y);

     always_comb
        case(s)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b10: y = d2;
            2'b11: y = d3;
          endcase
endmodule

module mem(input logic clk, we,
           input logic [31:0] a, wd,
           output logic [31:0] rd);

           logic [31:0] RAM[63:0];

 // initialize memory with instructions

 initial
  begin
    $readmemh("memfile.dat",RAM);
      // "memfile.dat" contains your instructions in hex
      // you must create this file
  end

 assign rd = RAM[a[31:2]]; // word aligned

 always_ff @(posedge clk)
  if (we)
    RAM[a[31:2]] <= wd;
Endmodule

module top(input logic clk, reset,
           output logic [31:0] writedata, adr,
           output logic memwrite);

 logic [31:0] readdata;

 // microprocessor (control & datapath)
 mips mips(clk, reset, adr, writedata, memwrite, readdata);

 // memory
 mem mem(clk, memwrite, adr, writedata, readdata);
endmodule

