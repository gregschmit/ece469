`include "serial1.sv"
module serial_tb();
logic [7:0] A;
integer num;
logic [7:0] testvector [3:0];
//create device
serial1 dut(A);

initial
begin
$readmemb("./serial1.tv);
for (num = 0; num < 3 ; num = num + 1)
  begin
  {A} = testvector[num]; #3;
  $display("\nnum=%d",num+1);
  $display("A=%b ,A);
  end
endmodule

//still missing the output confirmation. Need to complete the main file before completing this part
