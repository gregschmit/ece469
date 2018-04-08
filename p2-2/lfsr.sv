
module lfsr(input logic [6:0] taps, [7:0] d_in,
            output logic [7:0] d_out);

  always_comb begin
    d_out[0] = d_in[7];
    int i;
    for (i=0; i<7; i++) begin
      d_out[i+1] = taps[i] ? d_in[7] ^ d_in[i] : d_in[i];
    end
  end
endmodule
