
module lfsr(input logic clk, run, seed, init_tap, [7:0] seed_data, [6:0] taps,
            output logic [7:0] q);

  logic r[8];
  logic t[7];

  int i;
  always_ff @(posedge clk, seed) begin
    if (seed) begin
      for (i=0; i<7; i++) begin
        r[i] = seed_data[i];
        t[i] = taps[i];
      end
      r[7] = seed_data[7];
    end
    if (!seed && run) begin
      r[7] <= r[0];
      for (i=0; i<7; i++) begin
        r[i] <= t[i] ? r[0] ^ r[i+1] : r[i+1];
      end
    end
  end

  assign q = r;

endmodule
