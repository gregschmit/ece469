`include "s84.sv"
module s84_tb();



logic [7:0] A;
logic [3:0] B;
logic op;
logic [2:0] f_loc;
logic [1:0] f_type;
logic [7:0] C,C_expected;
logic [7:0] Y, Y_expected;
logic [3:0] Z, Z_expected;
logic [32:0] testvector [4:0];


s84 s84alu(A, B, op, f_loc, f_type, C, Y, Z);

integer num;

initial
begin

$readmemb("./s84.tv",testvector);

op=0;//use sqm, not ca2

for (num = 0; num<5; num = num + 1)
begin
{A, B, f_loc, f_type, C_expected, Y_expected} = testvector[num]; #10;
$display("num=%d",num+1);
$display("A=%b B=%b f_loc=%b f_type=%b C_exp=%b Y_exp=%d", A, B, f_loc, f_type, C_expected, Y_expected);
$display("C=%b Y=%d",C,Y);
if (C != C_expected)
begin
$display("C does not equal C_exp line num=%d",num+1);
end
if (Y != Y_expected)
begin
$display("Y does not equal Y_exp line num=%d",num+1);
end

end//end for


end

endmodule
