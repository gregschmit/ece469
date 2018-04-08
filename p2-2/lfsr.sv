
module lfsr(input logic [6:0] taps, [7:0] d_in,
            output logic [7:0] d_out);

  int i;
  always_comb begin
    d_out[7] = d_in[0];
    for (i=0; i<7; i++) begin
      d_out[i] <= taps[i] ? d_in[0] ^ d_in[i+1] : d_in[i+1];
    end
  end
endmodule
