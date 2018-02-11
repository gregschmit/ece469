`include "ALU.sv"
module testALUecep1();

logic [31:0] a;
logic [31:0] b;
logic [3:0] f;
logic [31:0] y;  //actual y value
//logic [31:0] expected_y; //expected y value
logic z;
//logic expected_zero;//expected zero value

//change first bracket numbers to reflect size of line
//change second bracket numbers to reflect the number of lines
logic [66:0] testvector[9:0];
integer num; // used for iterating through testvector
ALU dut(a,b,f[2:0],y,z); //please make sure I/Os are in correct order


initial 
begin
$readmemh("C:/Modeltech_pe_edu_10.4a/examples/testvector.tv",testvector);
for (num = 0; num <10;num = num + 1)
begin

{a,b,f} = testvector[num];#10;

$display("a=%h b=%h f=%b y=%h",a,b,f,y);
end



//it does not seem that the txt file has to be a project file
//you may just give the path
//uncomment line and add your correct path
//$readmemb("C:/Modeltech_pe_edu_10.4a/examples/testvector.txt",testvector);
/*
for (num =0; num<30; num = num + 1)
begin
{f,a,b,expected_y,expected_zero} = testvector[num];#10;
if (y == expected_y)
	$display("testcase# %d worked.",num);
else
	$display("Error occured on testcase# %d",num);	
end
*/
end

endmodule
