
`include "lfsr.sv"

module lfsr_testbench();

  // dict
  int i;
  int fails = 0;
  logic clk, run, seed, init_tap;
  logic [6:0] taps;
  logic [7:0] seed_data;
  logic [7:0] q;
  lfs dut(clk, run, seed, init_tap, seed_data, taps, q);

  always begin
    clk <= 1; # 5; clk <= 0; # 5;
  end
  int i;
  logic [18:0] data [5] = {
    {'b011, 'b11111111, 'b0100101},
    {'b100, 'b11111111, 'b0100101},
    {'b100, 'b11111111, 'b0100101},
    {'b001, 'b11111111, 'b0100101},
  }
  always @(negedge clk) begin
    if (i < 5) begin
      {run, seed, init_tap, [7:0] seed_data, [6:0] taps} = data[i];
    end
  end
endmodule
