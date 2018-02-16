
`include "sqm.sv"

module sqm_testbench();

  // testbench dict
  parameter int debug = 2;
  parameter int lines = 3;
  parameter int bits = 28;
  logic [bits-1:0] testvector[lines-1:0];

  // sqm device dict
  logic [7:0] a;
  logic [4:0] b;
  logic [7:0] c;
  logic [7:0] y;
  sqm dut(a,b,c,y);
  logic [7:0] exp_c;
  logic [7:0] exp_y;

  // test bench
  initial begin
    $readmemh("./sqm.tv", testvector);
    int i;
    int f = 0;
    for (i=0; i<lines; i++) begin
      // parse vector data and wait for signal propogation
      {a, b, expected_c, expected_y} = testvector[i];
      #10;
      if (debug >= 2)
        $display("%d: (a=%h b=%h) :: c=%h:%h y=%h:%h",i+1,a,b,exp_c,c,exp_y,y);
      if (exp_c != c || exp_y != y) begin
        if (debug >= 1)
          $display("Failure on line %i", i+1);
        f++;
      end
    end
    $display("%i failures out of %i tests", f, lines);
  end

endmodule