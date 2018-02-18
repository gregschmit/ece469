
module serial1s(input logic [7:0] a,
                output logic [3:0] y);
  int count = 0;
  logic [7:0] b = a;
  initial begin
    while (b != 0) begin
      b = b & (b << 1);
      count++;
    end
    assign y = count;
  end
endmodule
