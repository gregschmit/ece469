
`include "lfsr.sv"

module lfsr_testbench();

  // dict
  int i;
  int fails = 0;
  logic [6:0] taps;
  logic [7:0] d_in;
  logic [7:0] d_out;
  lfsr dut(taps, d_in, d_out);

  initial begin
    {taps, d_out} = b'010010111111111; #10;
    $display("d_out = %4d\n", d_out);
  end
endmodule
