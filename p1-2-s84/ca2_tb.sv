`include "ca2.sv"
module ca2_tb();
logic [7:0] A;
logic [3:0] B;
logic [7:0] Y;
logic [7:0] Y_expected;
integer num;
logic [19:0] testvector [9:0];
//create device
ca2 dut(A,B,Y);

initial
begin
$readmemb("C:/Modeltech_pe_edu_10.4a/examples/ca2.tv",testvector);
for (num = 0; num < 10; num = num + 1)
  begin
  {A,B,Y_expected} = testvector[num]; #10;
  $display("\nnum=%d",num+1);
  $display("A=%b B=%b Y=%b Y_exp=%b",A,B,Y,Y_expected);
  if (Y != Y_expected)
    begin
    $display("Y does not equal Y_exp----------------");
    end//end if
  end//end for
end//end initial

endmodule
