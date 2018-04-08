
`include "lfs.sv"

module lfs_testbench();

  // dict
  int i;
  int fails = 0;
  logic [6:0] taps;
  logic [7:0] d_in;
  logic [7:0] d_out;
  lfs dut(taps, d_in, d_out);

  initial begin
    {taps, d_in} = 'b010010111111111; #10;
    $display("d_out = %b\n", d_out);
  end
endmodule
