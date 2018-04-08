
module regfile(input logic clk, wr_e, data_src_lfs, wr_tap,
               input logic [31:0] wd,
               output logic [31:0] tap, r_addr);

  logic [31:0] tap_reg[31:0];
  logic [31:0] r_addr_reg[31:0];

  // three ported register file
  // read two ports combinationally
  // write third port on rising edge of clk
  // register 0 hardwired to 0
  // note: for pipelined processor, write third port // on falling edge of clk

  always_ff @(posedge clk) begin
    if (wr_e && wr_tap) tap_reg <= wd;
    if (wr_e && !wr_tap) r_addr_reg <= wd;
  end
endmodule
