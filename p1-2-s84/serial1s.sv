
module serial1s(input logic [7:0] a,
                output logic [3:0] y);
  int count = 0;
  while (a != 0) begin
    a = a & (a << 1);
    count++;
  end
  assign y = count;
endmodule
